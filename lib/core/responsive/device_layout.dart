import 'package:flutter/material.dart';

class DeviceLayout extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const DeviceLayout({required this.mobile, required this.desktop, super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= 1100) {
      /*************  ✨ Windsurf Command ⭐  *************/
      /// Builds a widget based on the device's screen width.
      ///
      /// If the screen width is greater than or equal to 1100, it returns
      /// [desktop]. Otherwise, it returns [mobile].
      ///
      /// [mobile] is the widget to be displayed on mobile devices.
      ///
      /// [desktop] is the widget to be displayed on desktop devices.
      /*******  77ae11ac-f744-48ee-9be3-5de1029b49dc  *******/
      return desktop;
    } else {
      return mobile;
    }
  }
}
