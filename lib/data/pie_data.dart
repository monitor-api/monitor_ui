import 'package:flutter/material.dart';
class PieData {

  static List<Data> data = [
    Data(name: "fail", percent: 20, color: Colors.red),
    Data(name: "warn", percent: 45, color: Colors.orangeAccent),
    Data(name: "success", percent: 35, color: Colors.greenAccent)
  ];
}

class Data {
  final String name;
  final double percent;
  final Color color;

  Data({required this.name, required this.percent, required this.color});
}