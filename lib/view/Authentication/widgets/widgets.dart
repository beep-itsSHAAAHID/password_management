import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../constants/colors.dart';
import '../../../helper/doc_helper_function.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final String text;
  const LoginButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(.05),
        side: BorderSide(color: Colors.grey.shade800, width: .1),
        fixedSize: const Size.fromHeight(50),
        padding: const EdgeInsets.symmetric(horizontal: 15),
      ),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )),
          Align(alignment: Alignment.centerLeft, child: icon),
        ],
      ),
    );
  }
}

class RichTwoPartsText extends StatelessWidget {
  final String text1;
  final String text2;
  final VoidCallback onTap;
  const RichTwoPartsText({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: text1,
        style: const TextStyle(color: TColors.black),
        children: [
          TextSpan(
            text: text2,
            style: const TextStyle(fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final TextEditingController? controller;

  const PasswordField({this.controller, super.key});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final ValueNotifier<bool> _isObscured = ValueNotifier(true);

  @override
  void dispose() {
    _isObscured.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = DocHelperFunctions.isDarkMode(context);
    return ValueListenableBuilder(
      valueListenable: _isObscured,
      builder: (context, value, child) {
        return TextField(
          controller: widget.controller,
          obscureText: value,
          decoration: InputDecoration(
            filled: true,
            fillColor: dark
                ? Colors.blueGrey.withOpacity(.1)
                : TColors.light.withOpacity(.1),
            hintText: "Password",
            prefixIcon: const Icon(IconlyLight.lock, size: 20),
            suffixIcon: IconButton(
              icon: Icon(
                value ? IconlyLight.hide : IconlyLight.show,
                size: 20,
              ),
              onPressed: () {
                _isObscured.value = !_isObscured.value;
              },
            ),
            prefixIconColor: dark ? Colors.white : Colors.black87,
            suffixIconColor: dark ? Colors.white : Colors.black87,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
        );
      },
    );
  }
}


class EmailField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String? hinttext;
  final IconData? icon;
  final TextEditingController? controller; // Corrected type

  const EmailField({
    this.controller,
    this.keyboardType,
    this.hinttext,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = DocHelperFunctions.isDarkMode(
        context); // Ensure this function exists and works as expected
    return TextField(
      controller: controller, // Use the controller
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: dark
            ? Colors.blueGrey.withOpacity(.1)
            : TColors.light.withOpacity(.1),
        hintText: hinttext ?? "",
        prefixIcon: icon != null ? Icon(icon) : null,
        prefixIconColor: dark ? Colors.white : Colors.black87,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
