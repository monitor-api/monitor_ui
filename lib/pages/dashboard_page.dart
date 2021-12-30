import 'package:flutter/material.dart';
import 'package:monitor_ui/components/charts/bar_chart.dart';
import 'package:monitor_ui/components/charts/pie_chart.dart';
import 'package:monitor_ui/components/status/status.dart';
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

    double statusContainerHeight = Responsive.height(context) * 0.88;
    double statusContainerWidth = Responsive.width(context) * (2 / 10);
    double chartContainerWidth = Responsive.width(context) * (5.95 / 10);

    double statusItemWidth = statusContainerWidth / 4.5;
    double statusItemPadding = statusItemWidth / 7.0;

    BoxDecoration boxDecorationWithBorder = BoxDecoration(
      color: secondaryColor,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      border: Border.all(color: Colors.white10),
    );


    return SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              const Header(),
              const SizedBox(height: defaultPadding),
              Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: defaultPadding ),
                      padding: const EdgeInsets.all(defaultPadding),
                      width: statusContainerWidth,
                      height: statusContainerHeight,
                      decoration: boxDecorationWithBorder,
                      child: Status(entries: entries, itemWidth: statusItemWidth, itemPadding: statusItemPadding),
                    ),
                    Container(
                      padding: const EdgeInsets.all(defaultPadding),
                      margin: const EdgeInsets.only(left: defaultPadding),
                      height: statusContainerHeight,
                      width: chartContainerWidth,
                      decoration: boxDecorationWithBorder,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: statusContainerHeight * 0.45,
                                width: chartContainerWidth * 0.45,
                                decoration: boxDecorationWithBorder,
                                child: PieChartPage(height: statusContainerHeight, width: chartContainerWidth),

                              ),
                              Container(
                                height: statusContainerHeight * 0.45,
                                width: chartContainerWidth * 0.45,
                                decoration: boxDecorationWithBorder,
                                child: PieChartPage(height: statusContainerHeight, width: chartContainerWidth),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: statusContainerHeight* 0.45,
                                width: chartContainerWidth* 0.965,
                                padding: const EdgeInsets.fromLTRB(0, 24, 20, 0),
                                decoration: boxDecorationWithBorder,
                                child: const BarChartPage(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ]
              )
            ],
          ),
        )
    );
  }
}


