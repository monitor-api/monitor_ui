import 'package:flutter/material.dart';
import 'package:monitor_ui/pages/side_menu.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            const Expanded(
              child: SideMenu(),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.blue,
              )
            )
          ],
        ),
      ),
    );
  }
}
