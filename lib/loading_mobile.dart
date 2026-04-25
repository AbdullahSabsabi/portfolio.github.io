import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myportfolio/core/theme/app_colors_theme.dart';
import 'package:myportfolio/features/home/presentation/pages/home_page.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadAssetsAndNavigate();
  }

  Future<void> _loadAssetsAndNavigate() async {
    // 1. قائمة بالصور التي تريد تحميلها مسبقاً قبل دخول الموقع
    final imagesToPrecache = [
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
      'assets/images/d1.jpg',
      'assets/images/d2.webp',
      'assets/images/d3.jpg',
      'assets/images/profile.webp',
      'assets/images/c1.webp',
      'assets/images/c2.webp',
      'assets/images/m1.webp',
      'assets/images/m2.webp',
      'assets/images/m3.webp',
      'assets/images/e1.webp',
      'assets/images/e2.webp',
      'assets/images/e3.webp',
      'assets/images/e4.webp',
      'assets/images/e5.webp',
      'assets/images/e6.webp',
      'assets/images/icon.webp',
    ];

    try {
      // 2. تحميل كل الصور بالتوازي لسرعة أكبر
      await Future.wait(
        imagesToPrecache.map(
          (path) => precacheImage(AssetImage(path), context),
        ),
      );
    } catch (e) {
      debugPrint("Error loading images: $e");
    }

    // 3. الانتقال للصفحة الرئيسية بعد انتهاء التحميل
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    const primaryPurple = AppColors.primary;

    return Scaffold(
      // أضفت Scaffold لضمان ظهور الـ UI بشكل صحيح
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [Colors.deepPurple.shade900, Colors.black87]
                : [
                    primaryPurple.withOpacity(0.6),
                    primaryPurple.withOpacity(0.9),
                  ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: SpinKitFadingGrid(color: Colors.white, size: 80.0),
        ),
      ),
    );
  }
}
