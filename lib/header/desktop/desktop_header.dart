import 'package:flutter/material.dart';
import 'package:monitor_ui/components/search_field/search_field.dart';
import 'package:monitor_ui/responsive.dart';

class DesktopHeader extends StatelessWidget {
  const DesktopHeader({
    Key? key,
  }) : super(key: key);

  @override Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: const EdgeInsets.only(top: 100),
        width: Responsive.width(context) / 2.2 ,
        child: const SearchField(),
      )
    ],
  );
}
