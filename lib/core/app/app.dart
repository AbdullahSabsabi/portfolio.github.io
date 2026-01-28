import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myportfolio/features/home/presentation/pages/home_page.dart';
import 'package:myportfolio/features/home/presentation/views/mobile/loading_mobile.dart';

import '../theme/app_theme.dart';
import 'providers.dart';

// class PortfolioApp extends ConsumerWidget {
//   const PortfolioApp({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final themeMode = ref.watch(themeModeProvider);

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Abdullah Portfolio',
//       theme: AppTheme.lightTheme,
//       darkTheme: AppTheme.darkTheme,
//       themeMode: themeMode,
//       home: const HomePage(),
//     );
//   }
// }
class PortfolioApp extends ConsumerStatefulWidget {
  const PortfolioApp({super.key});

  @override
  ConsumerState<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends ConsumerState<PortfolioApp> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate initial loading delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Abdullah Portfolio',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      home: _isLoading
          ? const LoadingScreen()
          : const HomePage(), // بعد الـ Loading يظهر HomePage
    );
  }
}
