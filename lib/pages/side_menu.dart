import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("images/logo.png"),
            ),
            DrawerListTitle(
              title: "Environments",
              svgSrc: "icons/menu_dashboard.svg",
              press: () {},
            ),
            DrawerListTitle(
              title: "DEV1/DEV2",
              svgSrc: "icons/development_phase.svg",
              press: () {},
            ),
            DrawerListTitle(
              title: "UAT/BCK",
              svgSrc: "icons/testing_phase.svg",
              press: () {},
            ),
            DrawerListTitle(
              title: "PRODUCTION",
              svgSrc: "icons/production_phase.svg",
              press: () {},
            )
          ],
        ),
      ),
    );
  }
}


class DrawerListTitle extends StatelessWidget {
  const DrawerListTitle({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0.0,
      onTap: () {},
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white54
        ),),
    );
  }
}