import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:password_management/view/Add_info/widgets/textfield.dart';
import 'package:password_management/view/Add_info/widgets/usertile_addinfo.dart';
import 'package:password_management/view/Settings_Page/widgets/custom_appbar.dart';
import 'package:password_management/view/Settings_Page/widgets/sectionheading.dart';
import 'package:password_management/view/Settings_Page/widgets/settings_menu_tile.dart';
import 'package:password_management/view/Settings_Page/widgets/t_primary_continer.dart';
import 'package:password_management/view/Settings_Page/widgets/t_user_tile.dart';

import '../../animations/fade_in_slide.dart';
import '../../constants/colors.dart';
import '../../constants/size.dart';
import '../Authentication/login_view.dart';

class AddInfo extends StatefulWidget {
  const AddInfo({super.key});

  @override
  State<AddInfo> createState() => _AddInfoState();
}

class _AddInfoState extends State<AddInfo> {
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
                      AddInfoTop(),
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
                      const FadeInSlide(
                        duration: .5,
                        child: Text(
                          "Enter Domain",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),
                      FadeInSlide(
                        duration: .5,
                        child: TextFields(
                          //controller: _fullNameController,
                          keyboardType: TextInputType.name,
                          icon: Iconsax.share,
                          hinttext: "Domain",
                        ),
                      ),
                      const SizedBox(height: 20),
                      const FadeInSlide(
                        duration: .5,
                        child: Text(
                          " Enter Username",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),
                      FadeInSlide(
                        duration: .5,
                        child: TextFields(
                          //controller: _phoneNumberController,
                          keyboardType: TextInputType.number,
                          icon: Iconsax.personalcard,
                          hinttext: "Username",
                        ),
                      ),
                      const SizedBox(height: 20),
                      const FadeInSlide(
                        duration: .5,
                        child: Text(
                          " Enter Email",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),
                      FadeInSlide(
                        duration: .5,
                        child: TextFields(
                         // controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          icon: Iconsax.category,
                          hinttext: "Email",
                        ),
                      ),
                      const SizedBox(height: 20),
                      const FadeInSlide(
                        duration: .6,
                        child: Text(
                          " Enter Password",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),
                      FadeInSlide(
                        duration: .6,
                        child: TextFields(
                          // controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          icon: Iconsax.security,
                          hinttext: "Password",
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),



                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {

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
                            "Submit Data!",
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
