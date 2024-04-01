import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:password_management/view/Settings_Page/widgets/custom_appbar.dart';
import 'package:password_management/view/Settings_Page/widgets/sectionheading.dart';
import 'package:password_management/view/Settings_Page/widgets/settings_menu_tile.dart';
import 'package:password_management/view/Settings_Page/widgets/t_primary_continer.dart';
import 'package:password_management/view/Settings_Page/widgets/t_user_tile.dart';
import '../../animations/fade_in_slide.dart';
import '../../constants/colors.dart';
import '../../constants/size.dart';
import '../Authentication/login_view.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: FadeInSlide(
            duration: 0.9,
            direction: FadeSlideDirection.ltr,
            child: Column(
              children: [
                //header
                const TPrimaryHeaderContainer(
                  child: Column(
                    children: [
                      SizedBox(
                        height: Tsizes.spcBtwitems - 5,
                      ),
                      //user profile card
                      TUserProfileTile(),
                      SizedBox(
                        height: Tsizes.spcbtwsections,
                      ),
                    ],
                  ),
                ),
                //body
                Padding(
                  padding: const EdgeInsets.all(Tsizes.defaultspace),
                  child: Column(
                    children: [
                      TSectionHeading(
                        title: 'Account Settings',
                        showActionButton: false,
                      ),
                      const SizedBox(
                        height: Tsizes.spcBtwitems,
                      ),
                      SettingsMenuTile(
                        icon: Iconsax.heart,
                        title: 'Favourite',
                        subtitle: 'Your favourite password here',
                        ontap: () {},
                      ),
                      SettingsMenuTile(
                        icon: Iconsax.bank,
                        title: 'Bank Account',
                        subtitle: 'For transactions and payment',
                        ontap: () {},
                      ),
                      SettingsMenuTile(
                        icon: Iconsax.notification,
                        title: 'Notification',
                        subtitle: 'Set any kind of notification message',
                        ontap: () {},
                      ),
                      SettingsMenuTile(
                        icon: Iconsax.security_card,
                        title: 'Account privacy',
                        subtitle: 'manage data usage and connected Accounts',
                        ontap: () {},
                      ),
                      //app Settings
                      SizedBox(
                        height: 10,
                      ),
                      TSectionHeading(
                        title: 'App Settings',
                        showActionButton: false,
                      ),
                      const SizedBox(
                        height: Tsizes.spcBtwitems,
                      ),
                      SettingsMenuTile(
                        icon: Iconsax.info_circle,
                        title: 'Help Center',
                        subtitle: 'Need Help Contact us!',
                        ontap: () {},
                      ),
                      const SizedBox(
                        height: Tsizes.spcbtwsections,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            // Sign out the user
                            await FirebaseAuth.instance.signOut();
                            // Using GetX to navigate back to the SignInView (login screen)
                            Get.offAll(() => SignInView());
                            // Optionally, clear any other app-specific state here if necessary
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.white, // Text color
                            side: BorderSide(color: Color.fromARGB(255, 23, 59, 89), width: 2.0), // Border color
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          ).copyWith(
                            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.blue; // Changes background color when the button is pressed
                                }
                                // Default color
                                return Color.fromARGB(255, 23, 59, 89); // Default background color
                              },
                            ),
                            overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.blue; // Overlay color when the button is pressed
                                }
                                return null; // Use the default overlay color
                              },
                            ),
                          ),
                          child: Text(
                            "Log Out",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.white,
                                letterSpacing: .5,
                              ),
                            ),
                          ),
                        ),

                      ),
                      const SizedBox(
                        height: Tsizes.spcbtwsections * 2,
                      )
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
