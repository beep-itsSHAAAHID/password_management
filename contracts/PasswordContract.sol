// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

contract PasswordManager {
    uint256 public passwordCount = 0;

    struct PasswordEntry {
        uint256 id;
        string domain;
        string username;
        string password;
    }

    mapping(uint256 => PasswordEntry) public passwords;
    mapping(address => uint256[]) private ownerToPasswords;

    event PasswordAdded(uint256 passwordId, string domain, string username, string password);
    event BlockAdded(uint256 blockNumber);

    function addPassword(string memory _domain, string memory _username, string memory _password) public {
        uint256 passwordId = passwordCount++;
        passwords[passwordId] = PasswordEntry(passwordId, _domain, _username, _password);
        ownerToPasswords[msg.sender].push(passwordId);
        emit PasswordAdded(passwordId, _domain, _username, _password);
    }

    function addBlock() public {
        emit BlockAdded(block.number);
    }

    function getPasswordDetails(uint256 passwordId) public view returns (PasswordEntry memory) {
        return passwords[passwordId];
    }

    function deletePassword(uint256 passwordId) public {
        delete passwords[passwordId];
        // Optionally remove password ID from ownerToPasswords mapping if necessary
    }

    function getPasswordCount() public view returns (uint256) {
        return passwordCount;
    }
}
