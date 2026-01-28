import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/core/theme/app_colors_theme.dart';
import 'package:myportfolio/features/home/presentation/widgets/github_button_widget.dart';
import 'package:myportfolio/project_model.dart';

class ProjectsMobileView extends ConsumerWidget {
  const ProjectsMobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final projects = <Project>[
      Project(
        name: 'WASK STYLE',
        description:
            'A full-featured e-commerce mobile application built with a clean and scalable architecture, focusing on user experience, authentication, and complete store management functionalities.\nThe app allows users to create accounts, browse products by categories, manage favorites, place orders, and simulate an online payment flow. It also includes an admin-side logic for managing products, categories, orders, and reports.',
        images: [
          'assets/images/e1.png',
          'assets/images/e2.png',
          'assets/images/e3.png',
          'assets/images/e4.png',
          'assets/images/e5.png',
          'assets/images/e6.png',
        ],
        tools: [
          'Flutter',
          'Dart',
          'UI Design',
          'Responsive UI',
          'Shared Preferences',
          'Cubit',
          'Clean Architecture',
          'asp.net core',
        ],
        githubUrl: 'https://github.com/AbdullahSabsabi/ecommerce_app',
      ),
      Project(
        name: 'Memo',
        description:
            'A fully functional Notes Application built using Flutter, featuring a complete local login system and notes management. The app allows users to create an account, log in, and manage their notes with options to add, edit, and delete them.',
        images: [
          'assets/images/m1.png',
          'assets/images/m2.png',
          'assets/images/m3.png',
        ],
        tools: [
          'Flutter',
          'Dart',
          'Shared Preferences',
          'Riverpod',
          'Reactive Forms',
        ],
        githubUrl: 'https://github.com/AbdullahSabsabi/memo_app',
      ),
      Project(
        name: 'Chat App',
        description:
            'A simple Chat App built using Flutter with full integration of Firebase. The application allows users to create an account and log in, then send and receive instant messages with real-time updates.',
        images: ['assets/images/c1.png', 'assets/images/c2.png'],
        tools: ['Flutter', 'Dart', 'Firebase'],
        githubUrl: 'https://github.com/AbdullahSabsabi/chat_app',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Section Title
          Text(
            'Projects',
            style: GoogleFonts.poppins(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: isDark ? AppColors.secondary : AppColors.primary,
            ),
          ),
          const SizedBox(height: 40),

          /// Projects List
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            separatorBuilder: (_, __) => const SizedBox(height: 30),
            itemBuilder: (context, index) {
              return ProjectCard(project: projects[index]);
            },
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  void _next() {
    if (_currentIndex < widget.project.images.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    }
  }

  void _prev() {
    if (_currentIndex > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      color: isDark
          ? const Color.fromARGB(255, 44, 34, 85).withOpacity(0.7)
          : Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(22)),
      ),
      child: Column(
        children: [
          /// ===== Image Slider =====
          Stack(
            children: [
              SizedBox(
                height: 230,
                width: double.infinity,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: widget.project.images.length,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  itemBuilder: (_, index) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(22),
                      ),
                      child: Image.network(
                        widget.project.images[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),

              /// ===== Left Arrow =====
              _NavArrow(
                icon: Icons.chevron_left_rounded,
                onTap: _prev,
                alignment: Alignment.centerLeft,
                isVisible: _currentIndex > 0,
                isDark: isDark,
              ),

              /// ===== Right Arrow =====
              _NavArrow(
                icon: Icons.chevron_right_rounded,
                onTap: _next,
                alignment: Alignment.centerRight,
                isVisible: _currentIndex < widget.project.images.length - 1,
                isDark: isDark,
              ),

              /// ===== Dots Indicator =====
              Positioned(
                bottom: 12,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.project.images.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentIndex == index ? 14 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _currentIndex == index
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(
                                context,
                              ).colorScheme.onSurface.withOpacity(0.3),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          /// ===== Content =====
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.project.name,
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppColors.secondary : AppColors.primary,
                  ),
                ),

                const SizedBox(height: 10),

                /// Description
                Text(
                  widget.project.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                const SizedBox(height: 20),

                Column(
                  children: widget.project.tools.map((tool) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          tool,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,

                            color: isDark
                                ? AppColors.secondary
                                : AppColors.primary,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 40),
                Center(child: GitHubLinkButton(url: widget.project.githubUrl)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavArrow extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Alignment alignment;
  final bool isVisible;
  final bool isDark;

  const _NavArrow({
    required this.icon,
    required this.onTap,
    required this.alignment,
    required this.isVisible,
    required this.isDark,
  });

  @override
  State<_NavArrow> createState() => _NavArrowState();
}

class _NavArrowState extends State<_NavArrow> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    if (!widget.isVisible) return const SizedBox();

    return Align(
      alignment: widget.alignment,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.isDark
                  ? Colors.black.withOpacity(0.45)
                  : Colors.white.withOpacity(0.7),
              boxShadow: _hovered
                  ? [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.4),
                        blurRadius: 12,
                      ),
                    ]
                  : [],
            ),
            child: Icon(widget.icon, size: 36, color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}

class ProjectImageSlider extends StatefulWidget {
  final List<String> images;

  const ProjectImageSlider({super.key, required this.images});

  @override
  State<ProjectImageSlider> createState() => _ProjectImageSliderState();
}

class _ProjectImageSliderState extends State<ProjectImageSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 220,
          child: PageView.builder(
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  widget.images[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              );
            },
          ),
        ),

        /// Indicators
        Positioned(
          bottom: 12,
          child: Row(
            children: List.generate(
              widget.images.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: currentIndex == index ? 16 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: currentIndex == index ? Colors.white : Colors.white54,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
