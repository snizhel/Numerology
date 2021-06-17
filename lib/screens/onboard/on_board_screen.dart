import 'package:elearn/widgets/circle_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:elearn/screens/auth/sign_in_screen.dart';
import 'package:elearn/utils/dimensions.dart';
import 'package:elearn/utils/strings.dart';
import 'package:elearn/utils/custom_color.dart';
import 'data.dart';

class OnBoardScreen extends StatefulWidget {
  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int totalPages = OnBoardingItems.loadOnboardItem().length;
  int next;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          itemCount: totalPages,
            itemBuilder: (context, index){
            OnBoardingItem oi = OnBoardingItems.loadOnboardItem()[index];

              next = index;
              //print(next);
              return Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  gradient: CustomColor.secondaryButtonGradient
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: Dimensions.topHeight
                      ),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          oi.image,
                          fit: BoxFit.fill,
                          height: 200,
                          width: 200,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: -10,
                      left: -10,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: Dimensions.marginSize * 1.5,
                          right: Dimensions.marginSize * 1.5,
                        ),
                        child: Container(
                          height: height * 0.5,
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radius * 2),
                              topRight: Radius.circular(Dimensions.radius * 2),
                            )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: Dimensions.marginSize,
                                        right: Dimensions.marginSize),
                                    child: Text(
                                      oi.title,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: Dimensions.extraLargeTextSize * 1.5,
                                          fontWeight: FontWeight.bold
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.heightSize * 2,),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: Dimensions.marginSize,
                                        right: Dimensions.marginSize),
                                    child: Text(
                                      oi.subTitle,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: Dimensions.largeTextSize,
                                        fontWeight: FontWeight.bold
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: Dimensions.heightSize * 4),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: index != (totalPages - 1) ? Padding(
                                    padding: const EdgeInsets.only(left: 40.0),
                                    child: Container(
                                      width: 140.0,
                                      height: 12.0,
                                      child: ListView.builder(
                                        itemCount: totalPages,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, i){
                                          return Padding(
                                            padding: const EdgeInsets.only(right: 10.0),
                                            child: Container(
                                              width: index == i ? 20 : 20.0,
                                              decoration: BoxDecoration(
                                                  color: index == i ? CustomColor.primaryColor :
                                                  CustomColor.primaryColor.withOpacity(0.3),
                                                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                      : Column(
                                        children: [
                                          GestureDetector(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                height: Dimensions.buttonHeight,
                                                width: 200,
                                                decoration: BoxDecoration(
                                                    gradient: CustomColor.primaryButtonGradient,
                                                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius
                                                        * 0.5))
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    Strings.signIn.toUpperCase(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: Dimensions.largeTextSize,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)
                                              => SignInScreen()));
                                            },
                                          ),
                                          SizedBox(height: Dimensions.heightSize,),
                                          GestureDetector(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                height: Dimensions.buttonHeight,
                                                width: 200,
                                                decoration: BoxDecoration(
                                                    gradient: CustomColor.secondaryButtonGradient,
                                                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius
                                                        * 0.5))
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    Strings.getStarted.toUpperCase(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: Dimensions.largeTextSize,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)
                                              => SignInScreen()));
                                            },
                                          ),
                                        ],
                                      ),
                                ),
                              ),
                              index != (totalPages - 1) ? Padding(
                                padding: const EdgeInsets.only(
                                  left: Dimensions.marginSize,
                                  right: Dimensions.marginSize,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      child: Text(
                                        Strings.skip,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: Dimensions.largeTextSize,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder:
                                            (builder) => SignInScreen()));
                                      },
                                    ),
                                    CircleButtonWidget(
                                      icon: 'assets/images/arrow_forward.png',
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder:
                                            (builder) => SignInScreen()));
                                      },
                                    )
                                  ],
                                ),
                              ) : Container(),
                              SizedBox(height: Dimensions.heightSize),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              );
            }),
      ),
    );
  }
}
