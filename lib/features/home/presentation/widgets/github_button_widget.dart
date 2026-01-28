import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class GitHubLinkButton extends StatefulWidget {
  final String url;

  const GitHubLinkButton({super.key, required this.url});

  @override
  State<GitHubLinkButton> createState() => _GitHubLinkButtonState();
}

class _GitHubLinkButtonState extends State<GitHubLinkButton> {
  bool _hovered = false;

  Future<void> _openGitHub() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _openGitHub,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: _hovered ? colorScheme.primary : colorScheme.surface,
            border: Border.all(color: colorScheme.primary, width: 1.5),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: colorScheme.primary.withOpacity(0.35),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                FontAwesomeIcons.github,
                size: 22,
                color: _hovered ? Colors.white : colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Text(
                'View on GitHub',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: _hovered ? Colors.white : colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
