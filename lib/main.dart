import 'package:elearn/screens/splash_screen.dart';
import 'package:elearn/utils/custom_color.dart';
import 'package:elearn/utils/strings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: CustomColor.primaryColor,
          fontFamily: 'Rajdhani'
      ),
      home: SplashScreen(),
    );
  }
}