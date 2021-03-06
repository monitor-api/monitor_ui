import 'package:flutter/material.dart';
import 'package:monitor_ui/pages/dashboard_page.dart';
import 'package:monitor_ui/pages/side_menu.dart';

class MainPage extends StatelessWidget {
  final Widget test;
  const MainPage({Key? key, required this.test}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: SideMenu(),
            ),
            Expanded(
              flex: 5,
              child: test
            )
          ],
        ),

      ),
    );
  }
}
