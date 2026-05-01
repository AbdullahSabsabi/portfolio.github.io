import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/core/theme/app_colors_theme.dart';
import 'package:myportfolio/core/theme/app_text_styles.dart';
import 'package:myportfolio/data.dart';
import 'package:myportfolio/features/home/presentation/widgets/contact_form.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:js' as js;

import 'package:myportfolio/core/widgets/scroll_entrance_animation.dart';

class ContactMobileView extends ConsumerWidget {
  const ContactMobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScrollEntranceAnimation(
            animationType: AnimationType.fadeInDown,
            child: Center(
              child: Text(
                'Contact',
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: isDark ? AppColors.secondary : AppColors.primary,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),

          // ===== Cards =====
          ...contacts.asMap().entries.map((entry) {
            final index = entry.key;
            final contact = entry.value;
            return ScrollEntranceAnimation(
              animationType: AnimationType.zoomIn,
              delay: Duration(milliseconds: 200 * index),
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color.fromARGB(255, 44, 34, 85).withOpacity(0.7)
                      : AppColors.lightSurface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.primary.withOpacity(0.3)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // أيقونة
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        contact['icon'] as IconData,
                        size: 26,
                        color: isDark ? AppColors.secondary : AppColors.primary,
                      ),
                    ),

                    const SizedBox(width: 16),

                    // نص
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contact['type'] as String,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: isDark
                                ? AppColors.secondary
                                : AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        SelectableText(
                          contact['value'] as String,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),

          const SizedBox(height: 40),

          // ===== Contact Form =====
          ScrollEntranceAnimation(
            animationType: AnimationType.fadeInUp,
            delay: const Duration(milliseconds: 600),
            child: const ContactForm(),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}


class ContactFooter extends StatelessWidget {
  const ContactFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 160,
      width: double.infinity,
      color: isDark
          ? const Color.fromARGB(255, 18, 1, 55)
          : Colors.grey.shade200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ===== Divider رفيع =====
          Divider(
            color: isDark ? Colors.white24 : Colors.grey.shade400,
            thickness: 1,
            height: 1,
          ),

          const SizedBox(height: 30),

          // ===== Social Icons Row =====
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialIcon(
                iconWidget: FaIcon(FontAwesomeIcons.linkedin),
                url: 'https://www.linkedin.com/in/abdullah-sabsabi-405433385',
              ),
              const SizedBox(width: 30),
              _SocialIcon(
                iconWidget: FaIcon(FontAwesomeIcons.github),
                url: 'https://github.com/AbdullahSabsabi',
              ),
            ],
          ),

          const SizedBox(height: 30),

          // ===== Footer Text =====
          Text(
            '© 2026 Abdullah Sabsabi - Built with Flutter',
            style: TextStyle(
              color: isDark
                  ? Colors.white70
                  : const Color.fromARGB(255, 95, 95, 95),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

// ===== Social Icon Widget =====

class _SocialIcon extends StatelessWidget {
  final Widget iconWidget;
  final String url;

  const _SocialIcon({required this.iconWidget, required this.url});

  void _launchURL(String url) async {
    final uri = Uri.parse(url);

    if (kIsWeb) {
      // للـ Web نستخدم window.open
      // flutter_web فقط
      // ignore: undefined_prefixed_name
      js.context.callMethod('open', [url, '_blank']);
    } else {
      // Mobile/Desktop
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        debugPrint('Could not launch $url');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchURL(url),
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.black12,
          shape: BoxShape.circle,
        ),
        child: iconWidget, // هنا نعرض أي أيقونة
      ),
    );
  }
}
