import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monitor_ui/components/dev2/dev2_dashboard.dart';
import 'package:monitor_ui/pages/dashboard_page.dart';
import 'package:monitor_ui/pages/main_page.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Monitoring apis',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == "/") return PageRouteBuilder(pageBuilder: (_, __, ___) => const MainPage(test: DashboardPage()));
        if (settings.name == "/dev2") return PageRouteBuilder(pageBuilder: (_, __, ___) => const MainPage(test: Dev2Dashboard()));
        return null; // TODO ADD 404 PAGE HERE
      },
    );
  }
}

