import 'package:flutter/material.dart';
import 'package:netizen/responsive/mobile_screen_layout.dart';
import 'package:netizen/responsive/web_screen_layout.dart';
import 'package:netizen/utils/global_variable.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenlayout;
  final Widget mobileScreenlayout;
  const ResponsiveLayout(
      {Key? key,
      required this.webScreenlayout,
      required this.mobileScreenlayout, required MobileScreenLayout mobileScreenLayout, required WebScreenLayout webScreenLayout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return webScreenlayout;
        }
        return mobileScreenlayout;
      },
    );
  }
}
