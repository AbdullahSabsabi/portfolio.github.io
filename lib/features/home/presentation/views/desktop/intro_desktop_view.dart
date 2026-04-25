import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:myportfolio/core/app/providers.dart';
import 'package:myportfolio/core/theme/app_colors_theme.dart';
import 'package:myportfolio/features/home/presentation/widgets/image.dart';
import '../../controllers/home_scroll_controller.dart';

class IntroDesktopView extends ConsumerStatefulWidget {
  const IntroDesktopView({super.key});

  @override
  ConsumerState<IntroDesktopView> createState() => _IntroDesktopViewState();
}

class _IntroDesktopViewState extends ConsumerState<IntroDesktopView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(themeModeProvider) == ThemeMode.dark;
    final size = MediaQuery.of(context).size;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
          child: Column(
            children: [
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: const SizedBox(width: 20)),
                  // ===== Text Column =====
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Animated Name
                      DefaultTextStyle(
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
                      const SizedBox(height: 25),
                      // Animated Title
                      DefaultTextStyle(
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
                      const SizedBox(height: 40),
                      Row(
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
                                  'https://drive.google.com/file/d/1CS89ueVxh1MtbrE5Rd0CXy-u4zQioeeE/view?usp=sharing';
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
                    ],
                  ),
                  Expanded(child: const SizedBox(width: 80)),
                  // ===== Profile Image =====
                  PulsingAvatar(radius: 200),
                ],
              ),
              SizedBox(height: 60),
            ],
          ),
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
