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
            children: [
              const Header(),
              const SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: defaultPadding),
                        padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                          vertical: defaultPadding / 2,
                        ),
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.white10),
                        ),
                      )
                  )

                ]
              )

            ],
          ),
        )
    );
  }
}