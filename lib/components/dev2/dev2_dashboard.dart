import 'package:flutter/material.dart';
import 'package:monitor_ui/components/environment/environment_status.dart';
import 'package:monitor_ui/constants.dart';
import 'package:monitor_ui/pages/header.dart';

class Dev2Dashboard extends StatelessWidget {
  const Dev2Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: const [
            Header(),
            SizedBox(height: defaultPadding * 2),
            StatusByEnvironment()
          ],
        ),
      )
    );
  }
}

