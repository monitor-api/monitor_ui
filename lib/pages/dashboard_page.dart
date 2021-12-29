import 'package:flutter/material.dart';
import 'package:monitor_ui/componant/status/status.dart';
import 'package:monitor_ui/constants.dart';
import 'package:monitor_ui/pages/header.dart';
import 'package:monitor_ui/responsive.dart';

class DashboardPage extends StatelessWidget {

  const DashboardPage({Key? key}) : super(key: key);

  @override Widget build(BuildContext context) {
    final List<Map<String, Object>> entries = <Map<String, Object>>[
      {'name': 'EMOBG', 'env': 'PROD', 'message': 'DOWN', 'color': danger},
      {'name': 'CAPACITY-API', 'env': 'UAT/BCK', 'message': 'SLOW', 'color': warn},
      {'name': 'CURRENCY-API', 'env': 'DEV2', 'message': 'ERRORS', 'color': warn},
      {'name': 'STATION', 'env': 'DEV1', 'message': 'UP', 'color': success},
    ];

    double statusContainerHeight = Responsive.height(context) * (8.5 / 10);
    double statusContainerWidth = Responsive.width(context) * (2 / 10);

    double statusItemWidth = statusContainerWidth / 4.5;
    double statusItemPadding = statusItemWidth / 7.0;

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
                  Container(
                    margin: const EdgeInsets.only(left: defaultPadding, top: defaultPadding * 5),
                    padding: const EdgeInsets.all(defaultPadding),
                    width: statusContainerWidth,
                    height: statusContainerHeight,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Status(entries: entries, itemWidth: statusItemWidth, itemPadding: statusItemPadding),
                  )
                ]
              )
            ],
          ),
        )
    );
  }
}