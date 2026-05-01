import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/core/theme/app_colors_theme.dart';
import 'package:myportfolio/data.dart';
import 'package:myportfolio/project_model.dart';

import 'package:myportfolio/core/widgets/scroll_entrance_animation.dart';

class AboutDesktopView extends ConsumerWidget {
  const AboutDesktopView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== Left Column =====
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ===== Title =====
                    ScrollEntranceAnimation(
                      animationType: AnimationType.fadeInLeft,
                      child: Text(
                        'About Me',
                        style: GoogleFonts.poppins(
                          fontSize: 52,
                          fontWeight: FontWeight.bold,
                          color:
                              isDark ? AppColors.secondary : AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    ScrollEntranceAnimation(
                      animationType: AnimationType.fadeInLeft,
                      delay: const Duration(milliseconds: 200),
                      child: Text(
                        'Get to know me better',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: isDark
                              ? const Color.fromARGB(255, 240, 237, 237)
                              : Colors.black54,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    // ===== Main About Card =====
                    ScrollEntranceAnimation(
                      animationType: AnimationType.fadeInLeft,
                      delay: const Duration(milliseconds: 400),
                      child: Card(
                        elevation: 12,
                        shadowColor: Colors.black38,
                        color: isDark
                            ? AppColors.darkSurface
                            : AppColors.lightSurface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Who I Am ?',
                                style: GoogleFonts.poppins(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'I am Abdullah Sabsabi, an Informatics Engineer and Flutter developer passionate about building clean, scalable, and high-performance applications. I focus on writing well-structured code with a strong emphasis on software architecture and user experience.\n'
                                'I believe that a good application is not just one that works, but one that is built to last—easy to maintain, easy to scale, and enjoyable to use. My goal is to continuously grow as a developer and reach a senior level where I can deliver reliable, professional solutions for real-world projects.',
                                style: GoogleFonts.poppins(
                                  fontSize: 17,
                                  color: isDark
                                      ? const Color.fromARGB(255, 240, 237, 237)
                                      : Colors.black54,
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 75),
                    // ===== Quick Info Row =====
                    Row(
                      children: [
                        Expanded(
                          child: ScrollEntranceAnimation(
                            animationType: AnimationType.zoomIn,
                            delay: const Duration(milliseconds: 600),
                            child: _infoBox(
                              title: 'Experience',
                              value: 'Flutter Dev',
                              isDark: isDark,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ScrollEntranceAnimation(
                            animationType: AnimationType.zoomIn,
                            delay: const Duration(milliseconds: 800),
                            child: _infoBox(
                              title: 'Focus',
                              value: 'Clean Code',
                              isDark: isDark,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ScrollEntranceAnimation(
                            animationType: AnimationType.zoomIn,
                            delay: const Duration(milliseconds: 1000),
                            child: _infoBox(
                              title: 'Goal',
                              value: 'Senior Level',
                              isDark: isDark,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 60),

              // ===== Right Column =====
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ===== Education =====
                    ScrollEntranceAnimation(
                      animationType: AnimationType.fadeInRight,
                      child: Text(
                        'Education',
                        style: GoogleFonts.poppins(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color:
                              isDark ? AppColors.secondary : AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ScrollEntranceAnimation(
                      animationType: AnimationType.fadeInRight,
                      delay: const Duration(milliseconds: 200),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColors.darkSurface.withOpacity(0.65)
                              : AppColors.lightSurface,
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            color: AppColors.primary.withOpacity(0.35),
                            width: 1.2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ===== Graduation Icon =====
                            Container(
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.15),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.school_rounded,
                                color: AppColors.primary,
                                size: 32,
                              ),
                            ),
                            const SizedBox(width: 20),
                            // ===== Education Info =====
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bachelor of Informatics Engineering',
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'University of Aleppo',
                                    style: GoogleFonts.poppins(fontSize: 16),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    '2019 – 2025',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          AppColors.primary.withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(22),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.star_rounded,
                                          size: 18,
                                          color: Colors.amber,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'GPA: 73.50',
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 50),

                    // ===== Work Experience =====
                    ScrollEntranceAnimation(
                      animationType: AnimationType.fadeInRight,
                      delay: const Duration(milliseconds: 400),
                      child: Text(
                        'Work Experience',
                        style: GoogleFonts.poppins(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color:
                              isDark ? AppColors.secondary : AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    ...experiences.asMap().entries.map((entry) {
                      final index = entry.key;
                      final exp = entry.value;
                      return ScrollEntranceAnimation(
                        animationType: AnimationType.fadeInRight,
                        delay: Duration(milliseconds: 500 + (index * 100)),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: isDark
                                  ? AppColors.darkSurface.withOpacity(0.65)
                                  : AppColors.lightSurface,
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                color: AppColors.primary.withOpacity(0.35),
                                width: 1.2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  blurRadius: 12,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ===== Work Icon =====
                                Container(
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary.withOpacity(0.15),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.work_rounded,
                                    color: AppColors.primary,
                                    size: 32,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                // ===== Experience Info =====
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        exp.title,
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        exp.company,
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: isDark
                                              ? AppColors.secondary
                                              : AppColors.primary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        exp.period,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Row(
                                        children: [
                                          Icon(Icons.location_on_rounded,
                                              size: 16, color: Colors.grey),
                                          const SizedBox(width: 6),
                                          Text(
                                            exp.location,
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          ),
                                          const SizedBox(width: 20),
                                          Icon(Icons.laptop_rounded,
                                              size: 16, color: Colors.grey),
                                          const SizedBox(width: 6),
                                          Text(
                                            exp.workType,
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),

                    const SizedBox(height: 40),

                    // ===== Skills Overview =====
                    ScrollEntranceAnimation(
                      animationType: AnimationType.fadeInRight,
                      delay: const Duration(milliseconds: 700),
                      child: Text(
                        'What I Care About ?',
                        style: GoogleFonts.poppins(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color:
                              isDark ? AppColors.secondary : AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Column(
                      children: [
                        ScrollEntranceAnimation(
                          animationType: AnimationType.fadeInUp,
                          delay: const Duration(milliseconds: 800),
                          child: _skillTile(
                            'Clean Architecture',
                            'Writing maintainable and scalable code',
                            isDark,
                          ),
                        ),
                        ScrollEntranceAnimation(
                          animationType: AnimationType.fadeInUp,
                          delay: const Duration(milliseconds: 900),
                          child: _skillTile(
                            'Flutter Performance',
                            'Optimized UI & state management',
                            isDark,
                          ),
                        ),
                        ScrollEntranceAnimation(
                          animationType: AnimationType.fadeInUp,
                          delay: const Duration(milliseconds: 1000),
                          child: _skillTile(
                            'Professional UI',
                            'Pixel-perfect & responsive layouts',
                            isDark,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),

          Center(
            child: ScrollEntranceAnimation(
              animationType: AnimationType.fadeInUp,
              delay: const Duration(milliseconds: 1200),
              child: Text(
                '“I build apps not just to work, but to last.”',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  // ===== Helper Widgets =====
  Widget _infoBox({
    required String title,
    required String value,
    required bool isDark,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkSurface.withOpacity(0.6)
            : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _skillTile(String title, String subtitle, bool isDark) {
    return Container(
      width: double.infinity,
      height: 90,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark
            ? const Color.fromARGB(255, 44, 34, 85).withOpacity(0.7)
            : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
