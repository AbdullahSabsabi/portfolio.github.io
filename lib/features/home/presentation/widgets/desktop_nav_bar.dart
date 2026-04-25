import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myportfolio/core/app/providers.dart';
import 'package:myportfolio/core/theme/app_colors_theme.dart';
import 'package:myportfolio/features/home/presentation/controllers/home_scroll_controller.dart';
import 'package:myportfolio/features/home/presentation/pages/home_page.dart';

class DesktopNavbar extends ConsumerWidget {
  const DesktopNavbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTab = ref.watch(activeSectionProvider);
    final isDark = ref.watch(themeModeProvider) == ThemeMode.dark;

    final navItems = {
      'About': HomeSection.about,
      'Skills': HomeSection.skills,
      'Projects': HomeSection.projects,
      'Contact': HomeSection.contact,
    };

    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 40),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: navItems.entries.map((entry) {
            final isActive = activeTab == entry.value;
            return InkWell(
              onTap: () {
                // Scroll إلى Section عند الضغط
                final key = sectionKeys[entry.value];
                if (key != null) {
                  scrollToSectionDesktop(ref, entry.value);
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  border: isActive
                      ? Border(
                          bottom: BorderSide(
                            color: AppColors.primary,
                            width: 2,
                          ),
                        )
                      : null,
                ),
                child: Text(
                  entry.key,
                  style: TextStyle(
                    color: isActive
                        ? AppColors.primary
                        : isDark
                        ? Colors.white70
                        : Colors.black87,
                    fontSize: 16,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // دالة Scroll منفصلة للـ Desktop
  void scrollToSectionDesktop(WidgetRef ref, HomeSection section) {
    final item = homeSections.firstWhere((e) => e.section == section);
    final context = item.key.currentContext;
    final scrollController = ref.read(scrollControllerProvider);

    if (context != null) {
      // تحديث الـ active tab مباشرة
      ref.read(activeSectionProvider.notifier).state = section;

      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
