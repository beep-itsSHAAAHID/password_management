import 'package:flutter/material.dart';

class GradientCard extends StatelessWidget {
  final String title;
  final String email;
  final IconData serviceIcon;
  final bool isPasswordVisible;
  final VoidCallback onToggleVisibility;
  final String password;
  final LinearGradient gradient; // Add this line for custom gradient

  const GradientCard({
    super.key,
    required this.title,
    required this.email,
    required this.serviceIcon,
    required this.isPasswordVisible,
    required this.onToggleVisibility,
    required this.password,
    required this.gradient, // Add this line to constructor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120, // Adjusted height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          gradient: gradient, // Use the passed gradient here
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {}, // Placeholder for onTap functionality
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(serviceIcon, color: Colors.white, size: 40),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text(email, style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.9))),
                        Text(isPasswordVisible ? password : '•' * password.length, style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.9))),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off, color: Colors.white),
                    onPressed: onToggleVisibility,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
