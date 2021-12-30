import 'package:flutter/material.dart';
import 'package:monitor_ui/data/pie_data.dart';

class IndicatorsWidget extends StatelessWidget {
  const IndicatorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: PieData.data
          .map((data) => Container(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: buildIndicator(color: data.color, name: data.name, percent: data.percent),
      )).toList(),
    );
  }

  Widget buildIndicator({
    required Color color,
    required String name,
    required double percent,
    double size = 16,
    Color textColor = const Color(0xfb938c8c),
  }) =>
      Row(
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: color,
            ),
          ),
          const SizedBox(width: 8,),
          Text(
              percent.toString() + "% " + name,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: textColor
              )
          )
        ],
      );
}