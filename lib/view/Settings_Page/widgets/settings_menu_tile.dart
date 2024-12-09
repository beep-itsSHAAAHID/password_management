import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      this.trailing,
      this.ontap});
  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: const Color.fromARGB(255, 23, 59, 89),
      ),
      title: Text(
        title,
        style: GoogleFonts.lato(
      textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
    ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.poppins(),
      ),
      trailing: trailing,
      onTap: ontap,
    );
  }
}
