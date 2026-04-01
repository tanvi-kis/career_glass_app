import 'package:flutter/material.dart';
import '../model/app_theme.dart';

class CareerGlassBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CareerGlassBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70 + MediaQuery.of(context).padding.bottom,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom,
        left: 8,
        right: 8,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.bottomNavBgLeft,
            AppColors.bottomNavBgRight,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        border: Border(
          top: BorderSide(color: AppColors.divider, width: 1),
          bottom: BorderSide(color: AppColors.divider, width: 1),
          right: BorderSide(color: AppColors.divider, width: 1),
          left: BorderSide(color: AppColors.divider, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.home_rounded,
            label: 'Home',
            isSelected: currentIndex == 0,
            onTap: () => onTap(0),
          ),
          _NavItem(
            icon: Icons.work_outline_rounded,
            label: 'Jobs',
            isSelected: currentIndex == 1,
            onTap: () => onTap(1),
          ),
          _NavItem(
            icon: Icons.bookmark_border_rounded,
            label: 'Saved',
            isSelected: currentIndex == 2,
            onTap: () => onTap(2),
          ),
          _NavItem(
            icon: Icons.notifications_none,
            label: 'Notification',
            isSelected: currentIndex == 3,
            onTap: () => onTap(3),
          ),

          _NavItem(
            icon: Icons.person_outline_rounded,
            label: 'Profile',
            isSelected: currentIndex == 4,
            onTap: () => onTap(4),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 64,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),

              child: Icon(
                icon,
                color: isSelected
                    ? AppColors.accentLight
                    : AppColors.textMuted,
                size: 22,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? AppColors.accentLight
                    : AppColors.textMuted,
                fontSize: 10,
                fontWeight:
                isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}