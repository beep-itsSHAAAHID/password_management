import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../../controller/user_controller.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
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
