import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget desktop;
  final Widget mobile;
  final Widget? tablet;

  const Responsive({
    Key? key,
    required this.desktop,
    required this.mobile,
    this.tablet,
  }) : super(key: key);

  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 850;
  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width < 1100 && MediaQuery.of(context).size.width >= 850;
  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1100;

  static double height(BuildContext context) => MediaQuery.of(context).size.height;
  static double width(BuildContext context) => MediaQuery.of(context).size.width;

  @override Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    if (_size.width >= 1100) { return desktop; }
    else if (_size.width >= 850 && tablet != null) { return tablet!; }
    else { return mobile; }
  }
}
