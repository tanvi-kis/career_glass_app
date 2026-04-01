import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {


  const BottomNav();

  @override
  Widget build(BuildContext context) {
    return
      Container(
      height: 75,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF171A29), Color(0xFF0E1640)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        border: Border(top: BorderSide(color: Color(0xFF3E4059), width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.home_rounded, 'Home', true),
          _navItem(Icons.work_outline, 'Jobs', false),
          _navItem(Icons.bookmark_border, 'Saved', false),
          _navItem(Icons.person_outline_rounded, 'Profile', false),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool active) {

    const Color activeColor = Color(0xFF1132D3);
    const Color inactiveColor = Color(0xFF3A4E72);

    return SizedBox(
      width: 72,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 26, color: active ? activeColor : inactiveColor),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: active ? FontWeight.w600 : FontWeight.w400,
              color: active ? activeColor : inactiveColor,
              letterSpacing: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
