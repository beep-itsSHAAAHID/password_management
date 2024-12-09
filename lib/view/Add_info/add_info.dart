import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:password_management/view/Add_info/widgets/textfield.dart';
import 'package:password_management/view/Add_info/widgets/usertile_addinfo.dart';
import 'package:password_management/view/Settings_Page/widgets/t_primary_continer.dart';
import '../../animations/fade_in_slide.dart';
import '../../blockchain_servies/blochchain_service_file.dart';


class AddInfo extends StatefulWidget {
  const AddInfo({super.key});

  @override
  State<AddInfo> createState() => _AddInfoState();
}

class _AddInfoState extends State<AddInfo> {
  final TextEditingController _domainController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController(); // Depending on your contract, might not be needed
  final TextEditingController _passwordController = TextEditingController();

  final PasswordService _passwordService = PasswordService(); // Initialize your password service

  @override
  void dispose() {
    _domainController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initializePasswordService();
    _checkBlockchainConnection();
  }

  Future<void> _initializePasswordService() async {
    try {
      await _passwordService.init();
    } catch (e) {
      print('Error initializing PasswordService: $e');
      // Handle initialization error here, such as showing an error message
    }
  }

  Future<void> _checkBlockchainConnection() async {
    bool isConnected = await _passwordService.checkConnection();
    if (!isConnected) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to connect to blockchain.')),
      );
    }
  }

  Future<void> _submitData() async {
    if (_validateInputs()) {
      try {
        // Call addPassword function from PasswordService
        await _passwordService.addPassword(
          _domainController.text,
          _usernameController.text,
          _passwordController.text,
        );

        // Add data to Firebase collection
        await FirebaseFirestore.instance.collection('details').add({
          'domain': _domainController.text,
          'username': _usernameController.text,
          'email': _emailController.text,
          'password': _passwordController.text,
        });

        // Clear the text fields after successful submission
        _domainController.clear();
        _usernameController.clear();
        _emailController.clear();
        _passwordController.clear();

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password added successfully to blockchain!')),
        );
      } catch (e) {
        print("Error is : $e");
        // Error handling
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add password: $e')),
        );
      }
    }
  }

  bool _validateInputs() {
    if (_domainController.text.isEmpty ||
        _usernameController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: FadeInSlide(
            duration: .1,
            direction: FadeSlideDirection.ltr,
            child: Column(
              children: [
                const TPrimaryHeaderContainer(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: AddInfoTop(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter Domain",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      TextFields(
                        controller: _domainController,
                        keyboardType: TextInputType.url,
                        icon: Iconsax.share,
                        hinttext: "Domain",
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Enter Username",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      TextFields(
                        controller: _usernameController,
                        keyboardType: TextInputType.text,
                        icon: Iconsax.personalcard,
                        hinttext: "Username",
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Enter Email",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      TextFields(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        icon: Iconsax.category,
                        hinttext: "Email",
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Enter Password",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      TextFields(
                        controller: _passwordController,
                        //obscureText: true,  // Hide password input
                        keyboardType: TextInputType.text,
                        icon: Iconsax.security,
                        hinttext: "Password",
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: _submitData,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 23, 59, 89),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          "Submit Data!",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              letterSpacing: .5,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
