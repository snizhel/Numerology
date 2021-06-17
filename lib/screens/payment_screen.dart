import 'package:elearn/utils/custom_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:elearn/utils/custom_color.dart';
import 'package:elearn/utils/dimensions.dart';
import 'package:elearn/utils/strings.dart';
import 'package:elearn/widgets/back_widget.dart';

import 'dashboard_screen.dart';

class PaymentScreen extends StatefulWidget {

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

enum SingingCharacter { card, mobileBanking}

class _PaymentScreenState extends State<PaymentScreen> {

  SingingCharacter _character = SingingCharacter.card;

  final couponController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              BackWidget(title: Strings.payment,),
              bodyWidget(context),
              buttonWidget(context)
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
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius * 2)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _courseWidget(context),
            SizedBox(height: Dimensions.heightSize,),
            _couponWidget(context),
            _paymentWidget(context)
          ],
        ),
      ),
    );
  }

  _courseWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize,
          right: Dimensions.marginSize,
          bottom: Dimensions.heightSize,
          top: Dimensions.heightSize,
      ),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(Dimensions.radius),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius),
                  topRight: Radius.circular(Dimensions.radius),
                ),
                child: Image.asset(
                  'assets/images/latest/1.png',
                  //height: 120,
                  width: 180,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: Dimensions.widthSize,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: Dimensions.marginSize
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Basic Graphics Course 2021',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.largeTextSize
                        ),
                        maxLines: 2,
                      ),
                      Text(
                        Strings.demoName,
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 15,
                          ),
                          Text(
                            '5.0',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.largeTextSize
                            ),
                          ),
                          Spacer(),
                          Text(
                            '\$59',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.largeTextSize
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _couponWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              style: CustomStyle.textStyle,
              controller: couponController,
              keyboardType: TextInputType.emailAddress,
              validator: (String value){
                if(value.isEmpty){
                  return Strings.pleaseFillOutTheField;
                }else{
                  return null;
                }
              },
              decoration: InputDecoration(
                  hintText: Strings.enterCoupon,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  labelStyle: CustomStyle.textStyle,
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: CustomStyle.textStyle,
                  prefixIcon: Icon(
                    Icons.redeem,
                    color: CustomColor.primaryColor,
                  )
              ),
            ),
          ),
          Container(
            height: Dimensions.buttonHeight,
            width: 150,
            decoration: BoxDecoration(
              color: CustomColor.primaryColor,
              borderRadius: BorderRadius.circular(Dimensions.radius)
            ),
            child: Center(
              child: Text(
                Strings.applyCoupon,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.largeTextSize
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _paymentWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimensions.heightSize * 3, left: Dimensions
          .marginSize, right: Dimensions.marginSize),
      child: Column(
        children: [
          Container(
            height: 60.0,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.1)),
                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
            ),
            child: ListTile(
              title: Row(
                children: [
                  Image.asset(
                    'assets/images/card/card1.png',
                    height: 30.0,
                  ),
                  SizedBox(width: Dimensions.widthSize,),
                  Image.asset(
                    'assets/images/card/card2.png',
                    height: 30.0,
                  ),
                ],
              ),
              leading: Radio(
                value: SingingCharacter.card,
                toggleable : true,
                autofocus : true,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                    print('value: '+_character.toString());
                  });
                },
              ),
            ),
          ),
          _character.toString() == 'SingingCharacter.card'? Column(
            children: [
              SizedBox(height: Dimensions.heightSize,),
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Image.asset(
                          'assets/images/card/card1.png',
                          height: 100.0,
                          width: 150.0,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(width: Dimensions.widthSize,),
                        Image.asset(
                          'assets/images/card/card2.png',
                          height: 100.0,
                          width: 150.0,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(width: Dimensions.widthSize,),
                        GestureDetector(
                          child: Container(
                            height: 100.0,
                            width: 150.0,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
                            ),
                            child: Center(
                              child: Text(
                                '${Strings.addNewCard.toUpperCase()} + ',
                                style: CustomStyle.textStyle,
                              ),
                            ),
                          ),
                          onTap: () {
                            /*Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                AddNewCardScreen()));*/
                          },
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ) : Container(),
          SizedBox(height: Dimensions.heightSize,),
          Container(
            height: 60.0,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.1)),
                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
            ),
            child: ListTile(
              title: Text(
                Strings.mobileBanking.toUpperCase(),
                style: CustomStyle.textStyle,
              ),
              leading: Radio(
                value: SingingCharacter.mobileBanking,
                toggleable : true,
                autofocus : true,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                    print('value: '+_character.toString());
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  buttonWidget(BuildContext context) {
    return Positioned(
      bottom: Dimensions.heightSize,
      left: Dimensions.marginSize,
      right: Dimensions.marginSize,
      child: GestureDetector(
        child: Container(
          height: Dimensions.buttonHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: CustomColor.primaryButtonGradient,
            borderRadius: BorderRadius.circular(Dimensions.radius)
          ),
          child: Center(
            child: Text(
              Strings.payment,
              style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.largeTextSize,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        onTap: () {
          _openPaymentSuccessDialog(context);
        },
      ),
    );
  }

  _openPaymentSuccessDialog(BuildContext context){
    showGeneralDialog(
        barrierLabel:
        MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.6),
        transitionDuration: Duration(milliseconds: 700),
        context: context,
        pageBuilder: (_, __, ___) {
          return Material(
            type: MaterialType.transparency,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: Dimensions.marginSize,
                  right: Dimensions.marginSize,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: 12, left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/payment_success.png'),
                      SizedBox(height: Dimensions.heightSize,),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: Dimensions.marginSize,
                          right: Dimensions.marginSize,
                        ),
                        child: Text(
                          Strings.successfullyPayment,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.largeTextSize
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.heightSize * 2,),
                      GestureDetector(
                        child: Container(
                          height: Dimensions.buttonHeight,
                          width: 150,
                          decoration: BoxDecoration(
                              color: CustomColor.primaryColor,
                              borderRadius: BorderRadius.circular(Dimensions.radius)
                          ),
                          child: Center(
                            child: Text(
                              Strings.backToHome.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                              DashboardScreen()));
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        transitionBuilder: (_, anim, __, child) {
          return SlideTransition(
            position:
            Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
            child: child,
          );
        });
  }
}
