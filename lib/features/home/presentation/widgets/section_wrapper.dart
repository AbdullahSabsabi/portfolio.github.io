import 'package:flutter/material.dart';

class SectionWrapper extends StatelessWidget {
  final GlobalKey sectionKey;
  final Widget child;

  const SectionWrapper({
    required this.sectionKey,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sectionKey,
      width: double.infinity,
      child: RepaintBoundary(child: child),
    );
  }
}
