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
      SizedBox(
        //padding: const EdgeInsets.only(top: 10),
        width: Responsive.width(context) / 2.1,
        child: const SearchField(),
      )
    ],
  );
}
