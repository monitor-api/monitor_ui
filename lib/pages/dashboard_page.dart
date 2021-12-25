import 'package:flutter/material.dart';
import 'package:monitor_ui/constants.dart';
import 'package:monitor_ui/pages/header.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: const [
              Header()
            ],
          ),
        )
    );
  }
}