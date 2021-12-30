import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartPage extends StatelessWidget {
  const BarChartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
        BarChartData(
            borderData: FlBorderData(show: false),
            barGroups: groupData()
        )
    );
  }
}

List<BarChartGroupData> groupData() => [
  getBarChartGroupData(1,4,5,3),
  getBarChartGroupData(2,4,2,3),
  getBarChartGroupData(3,4,5,8),
  getBarChartGroupData(4,4,3,3),
  getBarChartGroupData(5,4,3,3),
];

BarChartGroupData getBarChartGroupData(x, y1, y2, y3) => BarChartGroupData(barsSpace: 6,x: x, barRods: [
  BarChartRodData(borderRadius: BorderRadius.zero, y: y1, colors: [Colors.redAccent], width: 20),
  BarChartRodData(borderRadius: BorderRadius.zero, y: y2, colors: [Colors.greenAccent], width: 20),
  BarChartRodData(borderRadius: BorderRadius.zero, y: y3, colors: [Colors.orangeAccent], width: 20)
]);