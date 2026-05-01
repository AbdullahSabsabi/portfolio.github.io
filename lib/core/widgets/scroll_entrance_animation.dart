import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:visibility_detector/visibility_detector.dart';

enum AnimationType {
  fadeIn,
  fadeInUp,
  fadeInDown,
  fadeInLeft,
  fadeInRight,
  zoomIn,
  bounceIn,
  slideInUp,
}

class ScrollEntranceAnimation extends StatefulWidget {
  final Widget child;
  final AnimationType animationType;
  final Duration duration;
  final Duration delay;
  final double offset;

  const ScrollEntranceAnimation({
    required this.child,
    this.animationType = AnimationType.fadeInUp,
    this.duration = const Duration(milliseconds: 800),
    this.delay = Duration.zero,
    this.offset = 50,
    super.key,
  });

  @override
  State<ScrollEntranceAnimation> createState() => _ScrollEntranceAnimationState();
}

class _ScrollEntranceAnimationState extends State<ScrollEntranceAnimation> {
  bool _isVisible = false;
  final _visibilityKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: _visibilityKey,
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: RepaintBoundary(
        child: _isVisible ? _buildAnimation() : Opacity(opacity: 0, child: widget.child),
      ),
    );
  }

  Widget _buildAnimation() {
    switch (widget.animationType) {
      case AnimationType.fadeIn:
        return FadeIn(
          duration: widget.duration,
          delay: widget.delay,
          child: widget.child,
        );
      case AnimationType.fadeInUp:
        return FadeInUp(
          duration: widget.duration,
          delay: widget.delay,
          from: widget.offset,
          child: widget.child,
        );
      case AnimationType.fadeInDown:
        return FadeInDown(
          duration: widget.duration,
          delay: widget.delay,
          from: widget.offset,
          child: widget.child,
        );
      case AnimationType.fadeInLeft:
        return FadeInLeft(
          duration: widget.duration,
          delay: widget.delay,
          from: widget.offset,
          child: widget.child,
        );
      case AnimationType.fadeInRight:
        return FadeInRight(
          duration: widget.duration,
          delay: widget.delay,
          from: widget.offset,
          child: widget.child,
        );
      case AnimationType.zoomIn:
        return ZoomIn(
          duration: widget.duration,
          delay: widget.delay,
          child: widget.child,
        );
      case AnimationType.bounceIn:
        return BounceInUp(
          duration: widget.duration,
          delay: widget.delay,
          child: widget.child,
        );
      case AnimationType.slideInUp:
        return SlideInUp(
          duration: widget.duration,
          delay: widget.delay,
          from: widget.offset,
          child: widget.child,
        );
    }
  }
}
