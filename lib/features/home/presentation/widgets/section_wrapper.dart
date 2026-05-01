import 'package:flutter/material.dart';

class SectionWrapper extends StatelessWidget {
  final Widget child;

  const SectionWrapper({
    required GlobalKey sectionKey,
    required this.child,
  }) : super(key: sectionKey);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RepaintBoundary(child: child),
    );
  }
}

