import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/core/theme/app_colors_theme.dart';
import 'package:myportfolio/data.dart';

import 'package:myportfolio/core/widgets/scroll_entrance_animation.dart';

class SkillsMobileView extends ConsumerWidget {
  const SkillsMobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScrollEntranceAnimation(
              animationType: AnimationType.fadeInDown,
              child: Text(
                'Skills & Technologies',
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  color: isDark ? AppColors.secondary : AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: skills.asMap().entries.map((entry) {
                final index = entry.key;
                final skill = entry.value;
                final icon = skillIcons[skill] ?? Icons.star_outline_rounded;

                return ScrollEntranceAnimation(
                  animationType: AnimationType.zoomIn,
                  delay: Duration(milliseconds: 100 * index),
                  child: Container(
                    width: 300, // ياخذ كل عرض الصفحة
                    height: 60, // ارتفاع ثابت لكل Badge
                    margin: const EdgeInsets.only(
                      bottom: 12,
                    ), // مسافة بين كل Badge
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.35),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(icon, size: 30, color: AppColors.primary),
                        Expanded(
                          child: Center(
                            child: Text(
                              skill,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 40),

            ScrollEntranceAnimation(
              animationType: AnimationType.fadeInUp,
              child: Text(
                'Tools',
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  color: isDark ? AppColors.secondary : AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: tools.asMap().entries.map((entry) {
                final index = entry.key;
                final tool = entry.value;
                final icon = toolIcons[tool] ?? Icons.build_rounded;

                return ScrollEntranceAnimation(
                  animationType: AnimationType.zoomIn,
                  delay: Duration(milliseconds: 800 + (index * 50)),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.35),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(icon, size: 18, color: AppColors.primary),
                        const SizedBox(width: 8),
                        Text(
                          tool,
                          style: const TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

