import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/core/theme/app_colors_theme.dart';
import 'package:myportfolio/data.dart';

class SkillsDesktopView extends ConsumerWidget {
  const SkillsDesktopView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      child: Column(
        children: [
          // ===== Title =====
          Text(
            'Skills & Technologies',
            style: GoogleFonts.poppins(
              fontSize: 52,
              fontWeight: FontWeight.bold,
              color: isDark ? AppColors.secondary : AppColors.primary,
            ),
          ),
          const SizedBox(height: 60),

          /// ===== Skills Grid =====
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: skills.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 4.5,
            ),
            itemBuilder: (context, index) {
              final skill = skills[index];
              final icon = skillIcons[skill] ?? Icons.star_outline_rounded;

              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.35),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(icon, size: 32, color: AppColors.primary),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        skill,
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 80),

          /// ===== Tools =====
          Text(
            'Tools',
            style: GoogleFonts.poppins(
              fontSize: 52,
              fontWeight: FontWeight.bold,
              color: isDark ? AppColors.secondary : AppColors.primary,
            ),
          ),
          const SizedBox(height: 40),

          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: tools.map((tool) {
              final icon = toolIcons[tool] ?? Icons.build_rounded;

              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
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
                    Icon(icon, size: 20, color: AppColors.primary),
                    const SizedBox(width: 10),
                    Text(
                      tool,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
