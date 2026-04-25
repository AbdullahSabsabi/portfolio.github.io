import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

// 1️⃣ تعريف الأقسام
enum HomeSection { about, skills, projects, contact }

// 2️⃣ GlobalKeys لكل Section
final aboutKey = GlobalKey();
final skillsKey = GlobalKey();
final projectsKey = GlobalKey();
final contactKey = GlobalKey();

// 3️⃣ ScrollController Provider
final scrollControllerProvider = Provider.autoDispose<ScrollController>(
  (ref) => ScrollController(),
);

// 4️⃣ Active Section Provider (Tab النشط)
final activeSectionProvider = StateProvider<HomeSection>(
  (ref) => HomeSection.about,
);

class HomeSectionItem {
  final HomeSection section;
  final GlobalKey key;

  const HomeSectionItem({required this.section, required this.key});
}

final homeSections = [
  HomeSectionItem(section: HomeSection.about, key: aboutKey),
  HomeSectionItem(section: HomeSection.skills, key: skillsKey),
  HomeSectionItem(section: HomeSection.projects, key: projectsKey),
  HomeSectionItem(section: HomeSection.contact, key: contactKey),
];
