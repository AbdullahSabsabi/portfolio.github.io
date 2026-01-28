import 'package:flutter/material.dart';

class AppColors {
  // ===== Primary (Purple) =====
  static const Color primary = Color(0xFF7C4DFF);
  static const Color primaryDark = Color(0xFF651FFF);
  static const Color secondary = Color.fromARGB(
    255,
    239,
    208,
    245,
  ); // لون ثانوي لتسليط الضوء

  // ===== Light Theme =====
  static const Color lightBackground = Color(0xFFF8F7FC);
  static const Color lightSurface = Colors.white;
  static const Color lightTextPrimary = Color(0xFF1F1F1F);
  static const Color lightTextSecondary = Color(0xFF6B6B6B);
  static const Color lightAccent = primary; // استخدام البنفسجي كلون Accent

  // ===== Dark Theme =====
  static const Color darkBackground = Color(0xFF0F0B1E);
  static const Color darkSurface = Color(0xFF1A1433);
  static const Color darkTextPrimary = Colors.white;
  static const Color darkTextSecondary = Color(0xFFBDBDBD);
  static const Color darkAccent = primary; // استخدام البنفسجي كلون Accent

  // ===== Gradients =====
  static const LinearGradient lightGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color.fromARGB(255, 245, 245, 245),

      Color.fromARGB(255, 217, 182, 247),
      Color.fromARGB(255, 208, 197, 241),
    ],
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient darkGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color.fromARGB(255, 37, 30, 68),
      Color.fromARGB(255, 8, 4, 27),
      Color.fromARGB(255, 28, 22, 70),
    ],
    stops: [0.0, 0.5, 1.0],
  );

  // ===== Shadows & Decorations =====
  static const BoxShadow cardShadowLight = BoxShadow(
    color: Color(0x22000000),
    blurRadius: 12,
    offset: Offset(0, 4),
  );

  static const BoxShadow cardShadowDark = BoxShadow(
    color: Color(0x66000000),
    blurRadius: 16,
    offset: Offset(0, 6),
  );
}
