import 'package:elearn/utils/custom_color.dart';
import 'package:flutter/material.dart';

class CircleButtonWidget extends StatelessWidget {

  final String icon;
  final GestureTapCallback onTap;

  const CircleButtonWidget({Key key, this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          gradient: CustomColor.primaryButtonGradient,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: CustomColor.accentColor.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Image.asset(
          icon
        ),
      ),
      onTap: onTap,
    );
  }
}
