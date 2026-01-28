import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myportfolio/core/app/providers.dart';
import 'package:myportfolio/core/theme/app_colors_theme.dart';
import 'package:myportfolio/features/home/presentation/controllers/home_scroll_controller.dart';

class HomeTabBar extends ConsumerWidget {
  final void Function(HomeSection section)? onTabTap;

  const HomeTabBar({super.key, this.onTabTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTab = ref.watch(activeSectionProvider);
    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark;

    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark
            ? Colors.black.withOpacity(0.85)
            : Colors.white.withOpacity(0.85),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 12),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: HomeSection.values.map((section) {
          final isActive = section == activeTab;

          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              ref.read(activeSectionProvider.notifier).state = section;
              onTabTap?.call(section);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOut,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              transform: Matrix4.identity()..scale(isActive ? 1.05 : 1.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    section.icon,
                    size: 24,
                    color: isActive
                        ? AppColors.primary
                        : isDark
                        ? Colors.white70
                        : Colors.black54,
                  ),

                  const SizedBox(height: 4),

                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: isActive
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: isActive
                          ? AppColors.primary
                          : isDark
                          ? Colors.white70
                          : Colors.black54,
                    ),
                    child: Text(section.label),
                  ),

                  const SizedBox(height: 4),

                  // Indicator خفيف
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: isActive ? 1 : 0,
                    child: Container(
                      height: 3,
                      width: 18,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

extension HomeSectionExtension on HomeSection {
  String get label {
    switch (this) {
      case HomeSection.skills:
        return 'Skills';
      case HomeSection.about:
        return 'About';
      case HomeSection.projects:
        return 'Projects';
      case HomeSection.contact:
        return 'Contact';
    }
  }

  IconData get icon {
    switch (this) {
      case HomeSection.skills:
        return Icons.code_rounded;
      case HomeSection.about:
        return Icons.person_rounded;
      case HomeSection.projects:
        return Icons.work_rounded;
      case HomeSection.contact:
        return Icons.mail_rounded;
    }
  }
}
