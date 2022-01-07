import 'package:flutter/material.dart';
import 'package:monitor_ui/components/card/desktop/desktop_card.dart';
import 'package:monitor_ui/data/enums/status.dart';
import 'package:monitor_ui/header/desktop/desktop_header.dart';
import 'package:monitor_ui/responsive.dart';

class DesktopHome extends StatelessWidget {



  const DesktopHome({Key? key}) : super(key: key);

  @override Widget build(BuildContext context) => Scaffold(
    appBar: const PreferredSize(child: DesktopHeader(), preferredSize: Size.fromHeight(200)),
    body: Center(
      child: SizedBox(
        width: Responsive.width(context) / 2.2,
        height: Responsive.height(context),
        child: ListView.separated(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) => cardCreator(),
          separatorBuilder: (BuildContext context, int index) => const Divider(height: 30),
        ),
      ),
    ),
  );

  DesktopCard cardCreator() => const DesktopCard(name: "EmobG", status: Status.down, environment: "DEV2", gitLink: "https://about.gitlab.com/");
}
