import 'package:flutter/material.dart';

class HomeSliverHeader extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  HomeSliverHeader({required this.child, this.height = 56});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      height: height,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: child,
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant HomeSliverHeader oldDelegate) {
    return false;
  }
}
