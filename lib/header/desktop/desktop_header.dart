import 'package:flutter/material.dart';
import 'package:monitor_ui/components/search_field/search_field.dart';
import 'package:monitor_ui/responsive.dart';

class DesktopHeader extends StatelessWidget {
  const DesktopHeader({
    Key? key,
  }) : super(key: key);

  @override Widget build(BuildContext context) {
    double width = Responsive.width(context) / 3;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: width > 400 ? width : 400,
          child: const SearchField(),
        )
      ],
    );
  }
}
