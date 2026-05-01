import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:myportfolio/core/app/providers.dart';
import 'package:myportfolio/core/theme/app_colors_theme.dart';
import 'package:myportfolio/features/home/presentation/controllers/home_scroll_controller.dart';
import 'package:myportfolio/features/home/presentation/pages/home_page.dart';
import 'package:myportfolio/features/home/presentation/widgets/image.dart';

import 'package:myportfolio/core/widgets/scroll_entrance_animation.dart';

class IntroMobileView extends ConsumerWidget {
  const IntroMobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeModeProvider) == ThemeMode.dark;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            ZoomIn(
              duration: const Duration(milliseconds: 1000),
              child: const PulsingAvatar(radius: 150),
            ),
            const SizedBox(height: 50),
            // ===== Animated Name =====
            FadeInDown(
              duration: const Duration(milliseconds: 800),
              child: DefaultTextStyle(
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedTextKit(
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Hi, I am ',
                          speed: const Duration(milliseconds: 250),
                          cursor: '',
                          textStyle: GoogleFonts.poppins(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    AnimatedTextKit(
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Abdullah',
                          speed: const Duration(milliseconds: 250),
                          cursor: '|',
                          textStyle: GoogleFonts.poppins(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),

            // ===== Animated Title =====
            FadeInDown(
              duration: const Duration(milliseconds: 800),
              delay: const Duration(milliseconds: 400),
              child: DefaultTextStyle(
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : const Color.fromARGB(255, 78, 78, 78),
                ),
                child: AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Informatics Engineer & Flutter Developer',
                      textStyle: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 100),
                      cursor: '|',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),
            FadeInUp(
              duration: const Duration(milliseconds: 800),
              delay: const Duration(milliseconds: 800),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      shadowColor: AppColors.primary.withOpacity(0.6),
                      elevation: 8,
                    ),
                    onPressed: () {
                      const cvUrl =
                          'https://drive.google.com/file/d/1WCG3PcGY2CitRiyWllsniA6Eampso9--/view?usp=sharing';
                      html.window.open(cvUrl, '_blank');
                    },
                    child: Text(
                      'View CV',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: const BorderSide(color: AppColors.primary),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      scrollToSection(projectsKey);
                    },
                    child: Text(
                      'My Projects',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 75),
          ],
        ),
      ),
    );
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}

