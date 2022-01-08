import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monitor_ui/pages/home/home.dart';

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
      title: 'Monitor',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.robotoMonoTextTheme(Theme.of(context).textTheme),
        canvasColor: secondaryColor,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == "/") return PageRouteBuilder(pageBuilder: (_, __, ___) => const Home());
        return null; // TODO ADD 404 PAGE HERE
      },
    );
  }
}

