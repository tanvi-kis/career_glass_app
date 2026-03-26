import 'package:flutter/material.dart';
import '../screen/dash_screen.dart';
import '../screen/joblist_screen.dart';
import 'bottom_navbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  void onNavTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget getScreen() {
    switch (currentIndex) {
      case 0:
        return DashScreen(
          onNavTap: (int value) {},
          selectedNavIndex: 0,
        );
        case 1:
        return JobListScreen(
          onNavTap: onNavTap,
          selectedNavIndex: 1,
        );
      case 2:
        // return SavedScreen();
      case 3:
        // return ProfileScreen();
      default:
      return DashScreen(
        onNavTap: (int value) {},
        selectedNavIndex: 0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getScreen(),
      bottomNavigationBar: CareerGlassBottomNavBar(
        currentIndex: currentIndex,
        onTap: onNavTap,
      ),
    );
  }
}