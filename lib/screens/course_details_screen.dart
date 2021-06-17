import 'package:elearn/utils/custom_color.dart';
import 'package:elearn/utils/dimensions.dart';
import 'package:elearn/utils/strings.dart';
import 'package:elearn/widgets/back_widget.dart';
import 'package:flutter/material.dart';
import 'package:elearn/widgets/details/about_widget.dart';
import 'package:elearn/widgets/details/modules_widget.dart';
import 'package:elearn/widgets/details/instructor_widget.dart';
import 'package:elearn/widgets/details/review_widget.dart';
import 'package:elearn/screens/payment_screen.dart';

class CourseDetailsScreen extends StatefulWidget {
  final String title;

  const CourseDetailsScreen({Key key, this.title}) : super(key: key);

  @override
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              BackWidget(title: widget.title,),
              bodyWidget(context),
              buyNowButton(context)
            ],
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimensions.topHeight
      ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius * 2 ),
              topRight: Radius.circular(Dimensions.radius * 2 ),
            )
        ),
        child: detailsWidget(context),
      ),
    );
  }

  detailsWidget(BuildContext context) {
    int totalPages = 4;
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: PageView.builder(
          itemCount: totalPages,
          itemBuilder: (context, index) {
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 40.0,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 40,
                              color: index == 0 ? CustomColor.primaryColor : Colors.black,
                              child: Center(
                                child: Text(
                                  Strings.describe,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.defaultTextSize,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 40,
                              color: index == 1 ? CustomColor.primaryColor : Colors.black,
                              child: Center(
                                child: Text(
                                  Strings.modules,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.defaultTextSize,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 40,
                              color: index == 2 ? CustomColor.primaryColor : Colors.black,
                              child: Center(
                                child: Text(
                                  Strings.instructor,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.defaultTextSize,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 40,
                              color: index == 3 ? CustomColor.primaryColor : Colors.black,
                              child: Center(
                                child: Text(
                                  Strings.review,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.defaultTextSize,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: pageViewWidget(index),
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }

  pageViewWidget(int i) {
    switch(i) {
      case 0 :
        return AboutWidget();
      case 1 :
        return ModulesWidget();
      case 2 :
        return InstructorWidget();
      case 3 :
        return ReviewWidget();
      default :
        return AboutWidget();
    }
  }

  buyNowButton(BuildContext context) {
    return Positioned(
      right: Dimensions.marginSize,
      top: Dimensions.heightSize * 4,
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(Dimensions.radius * 2),
        child: GestureDetector(
          child: Container(
            height: Dimensions.buttonHeight,
            width: 80.0,
            decoration: BoxDecoration(
              color: CustomColor.primaryColor,
              borderRadius: BorderRadius.circular(Dimensions.radius * 2)
            ),
            child: Center(
              child: Text(
                Strings.buy.toUpperCase(),
                style: TextStyle(
                  fontSize: Dimensions.extraLargeTextSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentScreen()));
          },
        ),
      ),
    );
  }

}
