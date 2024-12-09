import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package

import '../../../controller/user_controller.dart';

class BackgroundWave extends StatelessWidget {
  final double height;

  const BackgroundWave({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: height,
        child: ClipPath(
          clipper: BackgroundWaveClipper(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 23, 59, 89),
                  Color.fromARGB(255, 136, 189, 232)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Hello Welcome 👋",
                        style: GoogleFonts.poppins(
                          // Use GoogleFonts to apply the Poppins font
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Obx(() {
                        final UserController userController =
                            Get.find<UserController>();
                        return Text(
                          userController.userName.value ?? "User",
                          style: GoogleFonts.poppins(
                            // Use GoogleFonts to apply the Poppins font
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        );
                      }),
                    ],
                  ),
                  const SizedBox(
                    width: 90,
                    height: 20,
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 24,
                    ),
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

class BackgroundWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    const minSize = 140.0;
    final p1Diff = ((minSize - size.height) * 0.5).truncate().abs();
    path.lineTo(0.0, size.height - p1Diff);

    final controlPoint = Offset(size.width * 0.4, size.height);
    final endPoint = Offset(size.width, minSize);

    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(BackgroundWaveClipper oldClipper) => oldClipper != this;
}
