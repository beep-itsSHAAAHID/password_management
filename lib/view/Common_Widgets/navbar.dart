import 'dart:developer';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

class CustomAnimatedBottomNav extends StatelessWidget {
  final NotchBottomBarController controller;
  final Function(int) onPageSelected;

  const CustomAnimatedBottomNav({
    Key? key,
    required this.controller,
    required this.onPageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedNotchBottomBar(
      notchBottomBarController: controller,
      color: Color.fromARGB(255, 23, 59, 89),
      showLabel: false,
      shadowElevation: 5,
      kBottomRadius: 28.0,
      notchColor: Color.fromARGB(255, 136, 189, 232),
      removeMargins: false,
      bottomBarWidth: MediaQuery.of(context).size.width *
          0.9, // Adjusted to use 90% of screen width
      showShadow: false,
      durationInMilliSeconds: 300,
      elevation: 1,
      bottomBarItems: const [
        BottomBarItem(
          inActiveItem: Icon(Icons.home_filled, color: Colors.white),
          activeItem: Icon(Icons.home_filled, color: Colors.black),
          itemLabel: 'Home',
        ),
        BottomBarItem(
          inActiveItem:
              Icon(Icons.add_circle_outline_sharp, color: Colors.white),
          activeItem: Icon(Icons.add_circle_outline_sharp, color: Colors.black),
          itemLabel: 'Add Password',
        ),
        BottomBarItem(
          inActiveItem: Icon(Icons.settings, color: Colors.white),
          activeItem: Icon(Icons.settings, color: Colors.black),
          itemLabel: 'Settings',
        ),
        // Add more items as needed
      ],
      onTap: onPageSelected,
      kIconSize: 24.0,
    );
  }
}
