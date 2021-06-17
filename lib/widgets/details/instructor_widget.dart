import 'package:flutter/material.dart';

import 'package:elearn/utils/custom_color.dart';
import 'package:elearn/utils/dimensions.dart';
import 'package:elearn/utils/strings.dart';
import 'package:elearn/utils/custom_style.dart';

class InstructorWidget extends StatefulWidget {
  @override
  _InstructorWidgetState createState() => _InstructorWidgetState();
}

class _InstructorWidgetState extends State<InstructorWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize,
          top: Dimensions.heightSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          profileWidget(context),
          aboutWidget(context),
        ],
      ),
    );
  }

  profileWidget(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/profile.png'
        ),
        SizedBox(width: Dimensions.widthSize,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Robat Jonson',
              style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.largeTextSize,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'Head Of Develop, DecoIT',
              style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.defaultTextSize,
              ),
            ),
            _data('assets/images/star.png', '5.0 Instructor Rating'),
            _data('assets/images/review.png', '55 Review'),
            _data('assets/images/study.png', '124 Students'),
            _data('assets/images/book.png', '75 Courses'),
          ],
        )
      ],
    );
  }

  aboutWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Instructor',
          style: TextStyle(
              color: Colors.black,
              fontSize: Dimensions.defaultTextSize,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: Dimensions.heightSize,),
        Text(
          'Contrary to popular belief, Lorem Ipsum is nosimplyrandom text. It has roots in a piece of classical Latin literature 45 BC, making it over 2000 years old',
          style: CustomStyle.textStyle,
        ),
        SizedBox(height: Dimensions.heightSize,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              Strings.bullet,
              style: TextStyle(
                  fontSize: Dimensions.defaultTextSize * 2,
                  color: CustomColor.primaryColor
              ),
            ),
            SizedBox(width: Dimensions.heightSize,),
            Expanded(
              child: Text(
                'Distracted by the readable content of a page when looking at its layout',
                style: CustomStyle.textStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }

  _data(String image, String title) {
    return Row(
      children: [
        Image.asset(
          image
        ),
        SizedBox(width: Dimensions.widthSize * 0.5,),
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: Dimensions.defaultTextSize,
          ),
        ),
      ],
    );
  }

}
