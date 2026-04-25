import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myportfolio/core/app/providers.dart';
import 'package:myportfolio/core/responsive/device_layout.dart';
import 'package:myportfolio/core/theme/app_colors_theme.dart';
import 'package:myportfolio/features/home/presentation/widgets/desktop_nav_bar.dart';

import '../controllers/home_scroll_controller.dart';
import '../widgets/home_tab_bar.dart';
import '../widgets/section_wrapper.dart';
import '../views/mobile/intro_mobile_view.dart';
import '../views/mobile/about_mobile_view.dart';
import '../views/mobile/skills_mobile_view.dart';
import '../views/mobile/projects_mobile_view.dart';
import '../views/mobile/contact_mobile_view.dart';
import '../views/desktop/intro_desktop_view.dart';
import '../views/desktop/about_desktop_view.dart';
import '../views/desktop/skills_desktop_view.dart';
import '../views/desktop/projects_desktop_view.dart';
import '../views/desktop/contact_desktop_view.dart';

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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(_scrollListener);
    });
  }

  // Removed duplicate _scrollListener method to resolve naming conflict.

  // دالة مساعدة للحصول على offset داخل ScrollController
  double _getOffset(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return double.infinity;
    final box = context.findRenderObject() as RenderBox;
    return box
            .localToGlobal(
              Offset.zero,
              ancestor: context.findAncestorRenderObjectOfType()!,
            )
            .dy +
        _scrollController.offset;
  }

  // void scrollToSection(GlobalKey key) {
  //   final context = key.currentContext;
  //   if (context != null) {
  //     Scrollable.ensureVisible(
  //       context,
  //       duration: const Duration(milliseconds: 500),
  //       curve: Curves.easeInOut,
  //     );
  //   }
  // }

  bool isScrollingByTab = false;

  void scrollToSection(HomeSection section) {
    final item = homeSections.firstWhere((e) => e.section == section);
    final context = item.key.currentContext;

    if (context != null) {
      // تفعيل flag
      isScrollingByTab = true;

      // تحديث الـ active tab مباشرة
      ref.read(activeSectionProvider.notifier).state = section;

      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      ).then((_) {
        // بعد انتهاء الحركة، إيقاف flag
        Future.delayed(const Duration(milliseconds: 50), () {
          isScrollingByTab = false;
        });
      });
    }
  }

  // ignore: unused_element
  void _scrollListener() {
    if (isScrollingByTab) return; // تجاهل تحديثات listener أثناء scroll من Tab

    final scrollOffset = _scrollController.offset;

    HomeSection? current;

    sectionKeys.forEach((section, key) {
      final ctx = key.currentContext;
      if (ctx != null) {
        final box = ctx.findRenderObject() as RenderBox;
        final pos =
            box.localToGlobal(Offset.zero).dy + _scrollController.offset;
        if (scrollOffset >= pos - 50) {
          // -50 لضبط التمرير
          current = section;
        }
      }
    });

    if (current != null && ref.read(activeSectionProvider) != current) {
      ref.read(activeSectionProvider.notifier).state = current!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeTab = ref.watch(activeSectionProvider);
    final isDark = ref.watch(themeModeProvider) == ThemeMode.dark;

    return Scaffold(
      body: Container(
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
                          // Intro Section
                          DeviceLayout(
                            mobile: const IntroMobileView(),
                            desktop: const IntroDesktopView(),
                          ),
                          // About Section
                          SectionWrapper(
                            sectionKey: aboutKey,
                            child: DeviceLayout(
                              mobile: const AboutMobileView(),
                              desktop: const AboutDesktopView(),
                            ),
                          ),
                          // Skills Section
                          SectionWrapper(
                            sectionKey: skillsKey,
                            child: DeviceLayout(
                              mobile: const SkillsMobileView(),
                              desktop: const SkillsDesktopView(),
                            ),
                          ),
                          // Projects Section
                          SectionWrapper(
                            sectionKey: projectsKey,
                            child: DeviceLayout(
                              mobile: const ProjectsMobileView(),
                              desktop: const ProjectsDesktopView(),
                            ),
                          ),
                          // Contact Section
                          SectionWrapper(
                            sectionKey: contactKey,
                            child: DeviceLayout(
                              mobile: Column(
                                children: [
                                  ContactMobileView(),
                                  ContactFooter(),
                                ],
                              ),
                              desktop: Column(
                                children: [
                                  ContactDesktopView(),
                                  ContactFooter(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // TabBar ثابت أسفل الصفحة للموبايل فقط
                DeviceLayout(
                  mobile: HomeTabBar(
                    onTabTap: (section) {
                      scrollToSection(section); // تمرير الـ HomeSection مباشرة
                    },
                  ),

                  desktop:
                      SizedBox.shrink(), // Desktop غالباً TabBar أعلى أو لا يحتاج
                ),
              ],
            ),
            DeviceLayout(
              mobile: SizedBox.shrink(),

              desktop: Align(
                alignment: Alignment.topRight,
                child: DesktopNavbar(),
              ), // Desktop غالباً TabBar أعلى أو لا يحتاج
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

final sectionKeys = {
  HomeSection.about: aboutKey,
  HomeSection.skills: skillsKey,
  HomeSection.projects: projectsKey,
  HomeSection.contact: contactKey,
};
