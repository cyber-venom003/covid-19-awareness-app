import 'package:flutter/material.dart';
import 'package:covid19/screens/option.dart';
import 'package:covid19/screens/home.dart';
import 'package:covid19/screens/live_data.dart';
import 'package:covid19/screens/about_covid.dart';
import 'package:covid19/screens/prevention.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        OptionScreen.id: (context) => OptionScreen(),
        LiveData.id: (context) => LiveData(),
        About.id: (context) => About(),
        Prevention.id: (context) => Prevention(),
      },
    );
  }
}