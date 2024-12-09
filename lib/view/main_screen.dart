import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:password_management/view/Settings_Page/settings.dart';
import 'Add_info/add_info.dart';
import 'Common_Widgets/navbar.dart';
import 'Homepage/home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final NotchBottomBarController _controller =
      NotchBottomBarController(index: 0);
  int _currentPageIndex = 0;


  void _changePage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentPageIndex,
        children: [
          HomePage(onNavigate: _changePage), // Pass the callback here
          const AddInfo(), // Other pages...
          const SettingsScreen(),
        ],
      ),
      bottomNavigationBar: CustomAnimatedBottomNav(
        controller: _controller,
        onPageSelected: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
      ),
    );
  }
}
