import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/core/theme/app_colors_theme.dart';
import 'package:myportfolio/data.dart';
import 'package:myportfolio/features/home/presentation/views/mobile/projects_mobile_view.dart';
import 'package:myportfolio/features/home/presentation/widgets/github_button_widget.dart';
import 'package:myportfolio/project_model.dart';

class ProjectsDesktopView extends ConsumerWidget {
  const ProjectsDesktopView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Projects',
            style: GoogleFonts.poppins(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: isDark ? AppColors.secondary : AppColors.primary,
            ),
          ),
          const SizedBox(height: 60),

          Column(
            children: projects
                .map(
                  (project) => Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: _DesktopProjectCard(project: project),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _DesktopProjectCard extends StatefulWidget {
  final Project project;

  const _DesktopProjectCard({required this.project});

  @override
  State<_DesktopProjectCard> createState() => _DesktopProjectCardState();
}

class _DesktopProjectCardState extends State<_DesktopProjectCard> {
  final PageController _controller = PageController();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark
            ? const Color.fromARGB(255, 44, 34, 85).withOpacity(0.7)
            : Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 20),
        ],
      ),
      child: Row(
        children: [
          /// ===== Images =====
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  SizedBox(
                    height: 300,
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: widget.project.images.length,
                      onPageChanged: (i) => setState(() => _index = i),
                      itemBuilder: (_, i) => Image.asset(
                        widget.project.images[i],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),

                  /// ===== Left Arrow =====
                  NavArrow(
                    icon: Icons.chevron_left_rounded,
                    alignment: Alignment.centerLeft,
                    isVisible: _index > 0,
                    onTap: () {
                      _controller.previousPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeOut,
                      );
                    },
                    isDark: isDark,
                  ),

                  /// ===== Right Arrow =====
                  NavArrow(
                    icon: Icons.chevron_right_rounded,
                    alignment: Alignment.centerRight,
                    isVisible: _index < widget.project.images.length - 1,
                    onTap: () {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeOut,
                      );
                    },
                    isDark: isDark,
                  ),

                  /// ===== Dots =====
                  Positioned(
                    bottom: 12,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.project.images.length,
                        (i) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _index == i ? 16 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: _index == i
                                ? AppColors.primary
                                : Colors.white54,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 40),

          /// ===== Content =====
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.project.name,
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppColors.secondary : AppColors.primary,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  widget.project.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),

                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: widget.project.tools
                      .map(
                        (tool) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            tool,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),

                const SizedBox(height: 30),
                GitHubLinkButton(url: widget.project.githubUrl),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
