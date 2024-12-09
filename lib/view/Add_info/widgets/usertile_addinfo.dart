import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password_management/view/main_screen.dart';


class AddInfoTop extends StatelessWidget {
  const AddInfoTop({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector( onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const MainScreen()));
      },
          child: const Icon(Icons.arrow_back_ios,color: Colors.white,)
      ),
      title: Text(
        'Enter Your Credentials',
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),

    );
  }
}
