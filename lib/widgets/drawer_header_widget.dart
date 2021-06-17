import 'package:elearn/screens/profile_screen.dart';
import 'package:elearn/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:elearn/utils/dimensions.dart';

class DrawerHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            top: Dimensions.heightSize,
            bottom: Dimensions.heightSize
        ),
        child: ListTile(
          leading: Image.asset(
            'assets/images/instructor/1.png',
          ),
          title: Text(
            Strings.demoName,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.largeTextSize
            ),
          ),
          subtitle: Text(
            Strings.demoEmail,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen()));
          },
        )
    );
  }
}