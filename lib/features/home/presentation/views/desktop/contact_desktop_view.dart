import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/core/theme/app_colors_theme.dart';
import 'package:myportfolio/data.dart';
import 'package:myportfolio/features/home/presentation/widgets/contact_form.dart';

class ContactDesktopView extends ConsumerWidget {
  const ContactDesktopView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// ===== Title =====
          Text(
            'Contact',
            style: GoogleFonts.poppins(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: isDark ? AppColors.secondary : AppColors.primary,
            ),
          ),

          const SizedBox(height: 60),

          /// ===== Grid =====
          SizedBox(
            width: width * 0.75,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: contacts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
                childAspectRatio: 3.2,
              ),
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return _ContactDesktopCard(
                  icon: contact['icon'] as IconData,
                  type: contact['type'] as String,
                  value: contact['value'] as String,
                );
              },
            ),
          ),

          const SizedBox(height: 80),
          
          /// ===== Contact Form =====
          SizedBox(
            width: width * 0.5, // Centered and limited width for desktop
            child: const ContactForm(),
          ),
          
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}

class _ContactDesktopCard extends StatefulWidget {
  final IconData icon;
  final String type;
  final String value;

  const _ContactDesktopCard({
    required this.icon,
    required this.type,
    required this.value,
  });

  @override
  State<_ContactDesktopCard> createState() => _ContactDesktopCardState();
}

class _ContactDesktopCardState extends State<_ContactDesktopCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
        decoration: BoxDecoration(
          color: isDark
              ? const Color.fromARGB(255, 44, 34, 85).withOpacity(0.75)
              : AppColors.lightSurface,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: AppColors.primary.withOpacity(_hovered ? 0.6 : 0.3),
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.35),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [],
        ),
        transform: _hovered
            ? (Matrix4.identity()..translate(0.0, -6.0))
            : Matrix4.identity(),
        child: Row(
          children: [
            /// Icon
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                widget.icon,
                size: 30,
                color: isDark ? AppColors.secondary : AppColors.primary,
              ),
            ),

            const SizedBox(width: 22),

            /// Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.type,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppColors.secondary : AppColors.primary,
                  ),
                ),
                const SizedBox(height: 6),
                SelectableText(
                  widget.value,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
