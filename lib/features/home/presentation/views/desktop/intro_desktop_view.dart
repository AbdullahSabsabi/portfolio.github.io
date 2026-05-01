import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:myportfolio/core/app/providers.dart';
import 'package:myportfolio/core/theme/app_colors_theme.dart';
import 'package:myportfolio/features/home/presentation/widgets/image.dart';
import '../../controllers/home_scroll_controller.dart';

import 'package:animate_do/animate_do.dart';
import 'package:myportfolio/core/widgets/scroll_entrance_animation.dart';

class IntroDesktopView extends ConsumerWidget {
  const IntroDesktopView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeModeProvider) == ThemeMode.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      child: Column(
        children: [
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox(width: 20)),
              // ===== Text Column =====
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Animated Name
                  FadeInDown(
                    duration: const Duration(milliseconds: 800),
                    child: DefaultTextStyle(
                      style: GoogleFonts.poppins(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextPrimary,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AnimatedTextKit(
                            isRepeatingAnimation: false,
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'Hi, I am ',
                                speed: const Duration(milliseconds: 250),
                                cursor: '',
                                textStyle: GoogleFonts.poppins(
                                  fontSize: 48,
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
                                  fontSize: 48,
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
                  // Animated Title
                  FadeInDown(
                    duration: const Duration(milliseconds: 800),
                    delay: const Duration(milliseconds: 400),
                    child: DefaultTextStyle(
                      style: GoogleFonts.poppins(
                        fontSize: 20,
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
                              fontSize: 24,
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
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 36,
                              vertical: 20,
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
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            side: const BorderSide(color: AppColors.primary),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 36,
                              vertical: 20,
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
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox(width: 80)),
              // ===== Profile Image =====
              ZoomIn(
                duration: const Duration(milliseconds: 1000),
                child: const PulsingAvatar(radius: 200),
              ),
            ],
          ),
          const SizedBox(height: 60),
        ],
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

