import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:monitor_ui/components/charts/indicators_widget.dart';
import 'package:monitor_ui/constants.dart';
import 'package:monitor_ui/data/pie_data.dart';

class PieChartPage extends StatelessWidget {
  final double height;
  final double width;
  const PieChartPage({Key? key, required this.height, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        SizedBox(
          height: height * 0.3,
          width: width * 0.3,
          child: PieChart(
              PieChartData(
                //borderData: FlBorderData(show: false),
                sectionsSpace: 5,
                centerSpaceRadius: 30,
                sections: getData(),
              )
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(defaultPadding/2),
                  child: IndicatorsWidget(),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}


  List<PieChartSectionData> getData() => PieData.data
      .mapIndexed((index, data) =>
      PieChartSectionData(
          color: data.color,
          value: data.percent,
          title: '${data.percent}%',
          titleStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )
      )
  ).toList();