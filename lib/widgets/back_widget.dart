import 'package:elearn/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:elearn/utils/dimensions.dart';

class BackWidget extends StatefulWidget {
  final String title;

  const BackWidget({Key key, this.title}) : super(key: key);

  @override
  _BackWidgetState createState() => _BackWidgetState();
}

class _BackWidgetState extends State<BackWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/bg.png',
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          color: CustomColor.primaryColor.withOpacity(0.8),
        ),
        Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: Dimensions.marginSize),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.white,
                    size: 30,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(width: Dimensions.widthSize * 2,),
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
