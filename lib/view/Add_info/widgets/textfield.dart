import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../helper/doc_helper_function.dart';

class TextFields extends StatelessWidget {
  final TextInputType? keyboardType;
  final String? hinttext;
  final IconData? icon;
  final TextEditingController? controller; // Corrected type

  const TextFields({
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