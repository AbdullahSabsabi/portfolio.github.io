import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myportfolio/core/app/providers.dart';
import 'package:myportfolio/core/theme/app_colors_theme.dart';

import '../controllers/home_scroll_controller.dart';
import '../widgets/home_tab_bar.dart';
import '../widgets/section_wrapper.dart';
import '../views/mobile/intro_mobile_view.dart';
import '../views/mobile/about_mobile_view.dart';
import '../views/mobile/skills_mobile_view.dart';
import '../views/mobile/projects_mobile_view.dart';
import '../views/mobile/contact_mobile_view.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ref.read(scrollControllerProvider);

    // Listener لتغيير الـ Tab النشط أثناء Scroll
    _scrollController.addListener(() {
      final scroll = _scrollController.offset;

      final aboutPos =
          aboutKey.currentContext?.findRenderObject() as RenderBox?;
      final skillsPos =
          skillsKey.currentContext?.findRenderObject() as RenderBox?;
      final projectsPos =
          projectsKey.currentContext?.findRenderObject() as RenderBox?;
      final contactPos =
          contactKey.currentContext?.findRenderObject() as RenderBox?;

      if (aboutPos != null &&
          scroll < skillsPos!.localToGlobal(Offset.zero).dy) {
        ref.read(activeSectionProvider.notifier).state = HomeSection.about;
      } else if (skillsPos != null &&
          scroll < projectsPos!.localToGlobal(Offset.zero).dy) {
        ref.read(activeSectionProvider.notifier).state = HomeSection.skills;
      } else if (projectsPos != null &&
          scroll < contactPos!.localToGlobal(Offset.zero).dy) {
        ref.read(activeSectionProvider.notifier).state = HomeSection.projects;
      } else {
        ref.read(activeSectionProvider.notifier).state = HomeSection.contact;
      }
    });
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

  @override
  Widget build(BuildContext context) {
    final activeTab = ref.watch(activeSectionProvider);
    final isDark = ref.watch(themeModeProvider) == ThemeMode.dark;

    return Scaffold(
      body: Container(
        //padding: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          gradient: isDark ? AppColors.darkGradient : AppColors.lightGradient,
        ),
        child: Stack(
          children: [
            // Scrollable Single Page
            Column(
              children: [
                Expanded(
                  child: ScrollConfiguration(
                    behavior: const ScrollBehavior().copyWith(
                      overscroll: false,
                      scrollbars: false,
                    ),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: [
                          const IntroMobileView(),
                          SectionWrapper(
                            sectionKey: aboutKey,
                            child: const AboutMobileView(),
                          ),
                          SectionWrapper(
                            sectionKey: skillsKey,
                            child: const SkillsMobileView(),
                          ),
                          SectionWrapper(
                            sectionKey: projectsKey,
                            child: const ProjectsMobileView(),
                          ),
                          SectionWrapper(
                            sectionKey: contactKey,
                            child: Column(
                              children: [ContactMobileView(), ContactFooter()],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // TabBar ثابت أسفل الصفحة
                HomeTabBar(
                  onTabTap: (section) {
                    switch (section) {
                      case HomeSection.about:
                        scrollToSection(aboutKey);
                        break;
                      case HomeSection.skills:
                        scrollToSection(skillsKey);
                        break;
                      case HomeSection.projects:
                        scrollToSection(projectsKey);
                        break;
                      case HomeSection.contact:
                        scrollToSection(contactKey);
                        break;
                    }
                  },
                ),
              ],
            ),

            // زر تغيير الثيم أعلى يسار الصفحة
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Consumer(
                  builder: (context, ref, _) {
                    final themeMode = ref.watch(themeModeProvider);
                    return Container(
                      decoration: BoxDecoration(
                        color: themeMode == ThemeMode.light
                            ? AppColors.secondary
                            : AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          themeMode == ThemeMode.light
                              ? Icons.dark_mode
                              : Icons.light_mode,
                          color: themeMode == ThemeMode.light
                              ? AppColors.primary
                              : AppColors.secondary,
                          size: 32,
                        ),
                        onPressed: () {
                          ref
                              .read(themeModeProvider.notifier)
                              .state = themeMode == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light;
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
