import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';
import 'package:http/http.dart' as http;

class PasswordService extends ChangeNotifier {
  List<PasswordEntry> passwords = [];
  final String _rpcUrl = 'http://192.168.189.136:7545';  // Correct RPC URL
  final String _wsUrl = 'ws://192.168.189.136:7545';     // Correct WebSocket URL
  final String _privateKey = 'a11b66ee3d5346e43dff980bbaf505c3353f2e17fa91e1e13a4e978dae9eea06'; // Remove the '0x' prefix
  final int _chainId = 1337; // Default chain ID for Ganache

  late Web3Client _web3client;
  late EthPrivateKey _passwordsCreds;

  PasswordService() {
    _passwordsCreds = EthPrivateKey.fromHex(_privateKey);
    init();
  }

  Future<void> init() async {
    print('Initializing PasswordService...');
    _web3client = Web3Client(_rpcUrl, http.Client(), socketConnector: () => IOWebSocketChannel.connect(_wsUrl).cast<String>());
    try {
      await getPasswordsABI();
      await getPasswordsDeployedContract();
      print("PasswordService initialized successfully.");
    } catch (e) {
      print("Failed to initialize PasswordService: $e");
      throw Exception("Initialization failed: $e");
    }
  }

  late ContractAbi _passwordsAbiCode;
  late EthereumAddress _passwordsContractAddress;
  DeployedContract? _passwordsDeployedContract;
  late ContractFunction _createPassword;
  late ContractFunction _deletePassword;
  late ContractFunction _getPasswords;
  late ContractFunction _passwordCount;
  late ContractFunction _addBlock;

  Future<void> getPasswordsABI() async {
    print('Loading ABI...');
    String abiFile = await rootBundle.loadString('build/contracts/PasswordManager.json');
    var jsonABI = jsonDecode(abiFile);
    _passwordsAbiCode = ContractAbi.fromJson(jsonEncode(jsonABI['abi']), 'PasswordManager');
    _passwordsContractAddress = EthereumAddress.fromHex(jsonABI["networks"]["5777"]["address"]);
    print('ABI loaded successfully.');
  }

  Future<void> getPasswordsDeployedContract() async {
    print('Getting deployed contract...');
    _passwordsDeployedContract = DeployedContract(_passwordsAbiCode, _passwordsContractAddress);
    _createPassword = _passwordsDeployedContract!.function('addPassword');
    _deletePassword = _passwordsDeployedContract!.function('deletePassword');
    _getPasswords = _passwordsDeployedContract!.function('getPasswordDetails');
    _passwordCount = _passwordsDeployedContract!.function('passwordCount');
    _addBlock = _passwordsDeployedContract!.function('addBlock');
    print('Deployed contract retrieved successfully.');
    fetchPasswords();
  }

  Future<void> fetchPasswords() async {
    print('Fetching passwords...');
    List totalPasswordsList = await _web3client.call(contract: _passwordsDeployedContract!, function: _passwordCount, params: []);
    int totalPasswordsLen = totalPasswordsList[0].toInt();
    passwords.clear();
    for (var i = 0; i < totalPasswordsLen; i++) {
      var temp = await _web3client.call(contract: _passwordsDeployedContract!, function: _getPasswords, params: [BigInt.from(i)]);
      if (temp[1] != "") {
        passwords.add(PasswordEntry(
          id: i.toString(), // Use the integer index directly as a string for display purposes
          domain: temp[1], // Assuming these are returned as strings directly
          username: temp[2],
          password: temp[3],
        ));
      }
    }
    notifyListeners();
    print('Passwords fetched successfully: $passwords');
  }

  Future<void> addPassword(String domain, String username, String password) async {
    if (_passwordsDeployedContract != null) {
      try {
        await _web3client.sendTransaction(
          _passwordsCreds,
          Transaction.callContract(
            contract: _passwordsDeployedContract!,
            function: _createPassword,
            parameters: [domain, username, password],
          ),
          chainId: _chainId,
        );
        print('Password added successfully.');
        fetchPasswords();
      } catch (e) {
        print("Error adding password: $e");
        throw Exception("Failed to add password: $e");
      }
    } else {
      print("Password contract not initialized.");
      throw Exception("Password contract not initialized.");
    }
  }

  Future<void> addBlock() async {
    if (_passwordsDeployedContract != null) {
      try {
        await _web3client.sendTransaction(
          _passwordsCreds,
          Transaction.callContract(
            contract: _passwordsDeployedContract!,
            function: _addBlock,
            parameters: [],
          ),
          chainId: _chainId,
        );
        print("Block added successfully.");
      } catch (e) {
        print("Error adding block: $e");
        throw Exception("Failed to add block: $e");
      }
    } else {
      print("Password contract not initialized.");
      throw Exception("Password contract not initialized.");
    }
  }

  Future<void> deletePassword(int passwordId) async {
    await _web3client.sendTransaction(
      _passwordsCreds,
      Transaction.callContract(
        contract: _passwordsDeployedContract!,
        function: _deletePassword,
        parameters: [BigInt.from(passwordId)],
      ),
      chainId: _chainId,
    );
    notifyListeners();
    fetchPasswords(); // Refresh the list after deletion
  }

  Future<bool> checkConnection() async {
    try {
      await _web3client.getBlockNumber();
      print("Connection to blockchain is successful.");
      return true;
    } catch (e) {
      print("Connection to blockchain failed: $e");
      return false;
    }
  }
}

class PasswordEntry {
  final String domain;
  final String id;
  final String username;
  final String password;
  bool isPasswordVisible;

  PasswordEntry({required this.id, required this.domain, required this.username, required this.password,this.isPasswordVisible = false,});
}
