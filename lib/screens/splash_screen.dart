import 'package:elearn/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:elearn/screens/onboard/on_board_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final List<Color> colors = <Color>[Colors.red, Colors.blue,Colors.amber];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
        Duration(
            seconds: 3
        ),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
            OnBoardScreen()
        ))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: Center(
        child: Image.asset(
          'assets/images/splash_logo.png',
          fit: BoxFit.fill,
          height: 100,
          width: 150,
        ),
      ),
    );
  }
}
