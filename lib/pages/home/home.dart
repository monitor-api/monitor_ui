import 'package:flutter/material.dart';
import 'package:monitor_ui/pages/home/desktop/desktop_home.dart';
import 'package:monitor_ui/pages/home/mobile/mobile_home.dart';
import 'package:monitor_ui/responsive.dart';

class Home extends StatelessWidget {

  const Home({Key? key}) : super(key: key);

  @override Widget build(BuildContext context) => const Responsive(
      desktop: DesktopHome(),
      mobile: MobileHome()
  );
}
