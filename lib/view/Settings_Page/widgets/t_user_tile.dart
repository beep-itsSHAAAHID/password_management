import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:password_management/view/Settings_Page/widgets/t_circular_image.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_url.dart';
import '../../../controller/user_controller.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.person,
          color: Colors.grey,
          size: 24,
        ),
      ),
      title: Obx(() {
        final UserController userController = Get.find<UserController>();
        return Text(
          userController.userName.value ?? "User",
          style: GoogleFonts.poppins(
            // Use GoogleFonts to apply the Poppins font
            color: Colors.white,
            fontSize: 20,
          ),
        );
      }),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Iconsax.edit,
          color: Colors.white,
        ),
      ),
    );
  }
}
