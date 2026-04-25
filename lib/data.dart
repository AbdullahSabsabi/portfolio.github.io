import 'package:flutter/material.dart';
import 'package:myportfolio/project_model.dart';

final projects = <Project>[
  Project(
    name: 'WAQF APP',
    description:
        'A comprehensive Islamic administrative platform designed to digitize and manage religious endowments and institutional services. Built with a robust architecture, the app features an advanced AI-powered chat system for user interaction and a professional admin dashboard for centralized management. The app provides end-to-end management for Friday sermons, fatwa inquiries, and Sharia institutes, alongside integrated prayer timings and real-time data handling. It ensures high performance and scalability by utilizing modern state management and reactive data flows.',
    images: [
      'assets/images/w1.webp',
      'assets/images/w2.webp',
      'assets/images/w3.webp',
      'assets/images/w4.webp',
      'assets/images/w5.webp',
      'assets/images/w6.webp',
      'assets/images/w7.webp',
      'assets/images/w8.webp',
      'assets/images/w9.webp',
      'assets/images/w10.webp',
    ],
    tools: [
      'Flutter',
      'Dart',
      'Supabase',
      'RiverPod',
      'Shared Preferences',
      'Cubit',
      'Clean Architecture',
      'AI integration',
      'Reactive Forms',
      'GO Router',
      'Admin Dashboard',
      'UI UX Design',
    ],
    githubUrl: 'https://github.com/AbdullahSabsabi/waqf_app',
  ),
  Project(
    name: 'WASK STYLE',
    description:
        'A full-featured e-commerce mobile application built with a clean and scalable architecture, focusing on user experience, authentication, and complete store management functionalities.\nThe app allows users to create accounts, browse products by categories, manage favorites, place orders, and simulate an online payment flow. It also includes an admin-side logic for managing products, categories, orders, and reports.',
    images: [
      'assets/images/e1.webp',
      'assets/images/e2.webp',
      'assets/images/e3.webp',
      'assets/images/e4.webp',
      'assets/images/e5.webp',
      'assets/images/e6.webp',
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
    name: 'DALLELAK',
    description:
        'A smart city guide and tourism mobile application designed to enhance the travel experience by providing real-time information about local attractions, landmarks, and services. Built with a focus on high performance and seamless map integration.The app enables users to discover historical sites, restaurants, and cafes with detailed descriptions, ratings, and precise geographic locations. It features an interactive mapping system, personalized favorites, and a dark mode option for a modern user experience.',
    images: [
      'assets/images/d1.jpg',
      'assets/images/d2.webp',
      'assets/images/d3.jpg',
    ],
    tools: [
      'Flutter',

      'Dart',

      'Supabase',

      'Clean Architecture',

      'Google Maps API',

      'Cubit / Bloc',

      'UI/UX Design',

      'Responsive UI',

      'Dark Mode Support',
    ],
    githubUrl: 'https://github.com/AbdullahSabsabi/dalleelak',
  ),
  Project(
    name: 'Memo',
    description:
        'A fully functional Notes Application built using Flutter, featuring a complete local login system and notes management. The app allows users to create an account, log in, and manage their notes with options to add, edit, and delete them.',
    images: [
      'assets/images/m1.webp',
      'assets/images/m2.webp',
      'assets/images/m3.webp',
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
    images: ['assets/images/c1.webp', 'assets/images/c2.webp'],
    tools: ['Flutter', 'Dart', 'Firebase'],
    githubUrl: 'https://github.com/AbdullahSabsabi/chat_app',
  ),
];

final contacts = [
  {
    'type': 'Email',
    'value': 'abduoalllh2001@gmail.com',
    'icon': Icons.email_rounded,
  },
  {'type': 'Phone', 'value': '+963 945 342 091', 'icon': Icons.phone_rounded},
  {
    'type': 'Location',
    'value': 'Aleppo , Syria',
    'icon': Icons.location_on_rounded,
  },
];

final List<String> tools = [
  'VS Code',
  'Android Studio',

  'Git',
  'GitHub',
  'Postman',
  'Figma',
  'Firebase Console',
  'Supabase Console',
];

final Map<String, IconData> toolIcons = {
  'VS Code': Icons.code_rounded,
  'Android Studio': Icons.android_rounded,

  'Git': Icons.merge_type_rounded,
  'GitHub': Icons.cloud_rounded, // ممكن تحط GitHub Icon لو عندك Package
  'Postman': Icons.send_rounded,
  'Figma': Icons.design_services_rounded,
  'Firebase Console': Icons.cloud_rounded,
  'Supabase Console': Icons.storage_rounded,
};

final skills = [
  'Flutter',
  'Dart',
  'UI Design',
  'Responsive UI',

  'BLoC',
  'Riverpod',
  'Cubit',
  'Local Storage',

  'Clean Architecture',
  'Performance Optimization',

  'Firebase',
  'Supabase',
  'REST API',

  'Teamwork',
  'Problem Solving',
  'Time Management',
  'Communication',
  'Adaptability'
      'Creativity',
];
final Map<String, IconData> skillIcons = {
  // ===== Flutter & Dart =====
  'Flutter': Icons.flutter_dash,
  'Dart': Icons.code_rounded,
  'UI Design': Icons.design_services_rounded,
  'Responsive UI': Icons.devices_rounded,

  'BLoC': Icons.account_tree_rounded,
  'Riverpod': Icons.hub_rounded,
  'Cubit': Icons.extension_rounded,
  'Local Storage': Icons.storage_rounded,

  'Clean Architecture': Icons.layers_rounded,
  'Performance Optimization': Icons.speed_rounded,

  'Firebase': Icons.cloud_rounded,
  'Supabase': Icons.storage_rounded,
  'REST API': Icons.api_rounded,

  // ===== Soft Skills =====
  'Teamwork': Icons.group_rounded,
  'Problem Solving': Icons.psychology_rounded,
  'Time Management': Icons.schedule_rounded,
  'Communication': Icons.chat_rounded,
  'Adaptability': Icons.autorenew_rounded,
  'Creativity': Icons.lightbulb_rounded,
};

final experiences = <Experience>[
  Experience(
    title: 'Flutter Developer',
    company: 'ISS Group',
    period: 'April 2026 - Present',
    location: 'Aleppo, Syria',
    workType: 'On-site',
  ),
  Experience(
    title: 'FULL Stack Mobile Developer (Flutter & Express.js)',
    company: 'Midad Organisation',
    period: 'May 2025 - Present',
    location: 'Aleppo, Syria',
    workType: 'Hybrid',
  ),
];
