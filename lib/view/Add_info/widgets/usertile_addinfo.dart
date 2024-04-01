import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:password_management/view/Settings_Page/widgets/t_circular_image.dart';
import 'package:password_management/view/main_screen.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_url.dart';
import '../../../controller/user_controller.dart';

class AddInfoTop extends StatelessWidget {
  const AddInfoTop({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector( onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> MainScreen()));
      },
          child: Icon(Icons.arrow_back_ios,color: Colors.white,)
      ),
      title: Text(
        'Enter Your Credentials',
        style: GoogleFonts.poppins(
          textStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),

    );
  }
}
