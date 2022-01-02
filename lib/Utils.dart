import 'package:flutter/material.dart';

BoxDecoration boxDecorationWithBorder({required Color color, double radius = 10}) => BoxDecoration(
  color: color,
  borderRadius: BorderRadius.all(Radius.circular(radius)),
  border: Border.all(color: Colors.white10),
);