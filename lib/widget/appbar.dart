import 'package:flutter/material.dart';
import '../model/app_theme.dart';

class CareerGlassAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showSearch;
  final bool showLogo;
  final String? title;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;

  const CareerGlassAppBar({
    super.key,
    this.showSearch = false,
    this.showLogo = true,
    this.title,
    this.actions,
    this.onBackPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64 + MediaQuery.of(context).padding.top,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 16,
        right: 16,
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
        children: [
          if (onBackPressed != null) ...[
            GestureDetector(
              onTap: onBackPressed,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.textPrimary,
                  size: 16,
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
          if (showLogo) ...[
            // Logo circle
            Container(
              width: 36, height: 36,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.accent, AppColors.accentLight],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Center(
                child: Text('CG',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'CareerGlass',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 17,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.3,
              ),
            ),
          ] else if (title != null) ...[
            Text(
              title!,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 17,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.3,
              ),
            ),
          ],
          const Spacer(),
          if (showSearch) ...[
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.search_rounded,
                color: AppColors.textPrimary,
                size: 18,
              ),
            ),
            const SizedBox(width: 8),
          ],
          if (actions != null) ...actions!,
          if (actions == null && !showSearch) ...[
            Container(
              width: 40, height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF252840),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Center(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(Icons.notifications_outlined,
                          color: Colors.white70, size: 22),
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                    right: 8, top: 8,
                    child: Container(
                      width: 8, height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFF1132D3),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            GestureDetector(
              onTap: () {},
              child: Container(
                width: 40, height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF2B3B7C), width: 2.5),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile.png',
                    width: 38, height: 38,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: const Color(0xFF252840),
                      child: const Icon(Icons.person, color: Colors.white54, size: 22),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}