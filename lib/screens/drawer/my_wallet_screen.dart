import 'package:elearn/data/card.dart';
import 'package:elearn/utils/custom_color.dart';
import 'package:elearn/utils/custom_style.dart';
import 'package:elearn/utils/dimensions.dart';
import 'package:elearn/utils/strings.dart';
import 'package:elearn/widgets/back_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:elearn/screens/add_card_screen.dart';

class MyWalletScreen extends StatefulWidget {
  @override
  _MyWalletScreenState createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: Stack(
          children: [
            BackWidget(title: Strings.myWallet,),
            bodyWidget(context)
          ],
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
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius * 2),
              topRight: Radius.circular(Dimensions.radius * 2),
            )
        ),
        child: Column(
          children: [
            SizedBox(height: Dimensions.heightSize * 3,),
            _currentBalanceWidget(context),
            SizedBox(height: Dimensions.heightSize * 3,),
            _paymentGatewayWidget(context),
          ],
        ),
      ),
    );
  }

  _currentBalanceWidget(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\$',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: Dimensions.extraLargeTextSize
              ),
            ),
            Text(
              '450.00',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: Dimensions.extraLargeTextSize * 1.8,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        Text(
          Strings.totalDeposit,
          style: TextStyle(
            color: Colors.black,
            fontSize: Dimensions.largeTextSize
          ),
        ),
      ],
    );
  }

  _paymentGatewayWidget(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: GatewayList.list().length,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Gateway gateway = GatewayList.list()[index];
          return Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.marginSize,
                right: Dimensions.marginSize * 0.5,
              top: Dimensions.heightSize,
              bottom: Dimensions.heightSize,
            ),
            child: index == 0 ? _addCardWidget(context)
                : gatewayWidget(gateway)
          );
        },
      ),
    );
  }

  _addCardWidget(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 10,
              offset: Offset(1, 1), // Shadow position
            ),
          ],
        ),
        child: Icon(
          Icons.add,
          color: CustomColor.primaryColor,
          size: 40,
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddCardScreen()));
      },
    );
  }

  _inputAmountDialog(BuildContext context){
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
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(Dimensions.radius)
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -40,
                      left: 0,
                      right: 0,
                      child: Align(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: CustomColor.secondaryColor,
                              border: Border.all(
                                width: 5,
                                color: CustomColor.primaryColor.withOpacity(0.5)
                              )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/splash_logo.png',
                                height: 80,
                                width: 80,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                            width: 200,
                            child: TextFormField(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Dimensions.extraLargeTextSize,
                                  fontWeight: FontWeight.bold
                              ),
                              controller: amountController,
                              cursorColor: Colors.black,
                              cursorHeight: 30,
                              keyboardType: TextInputType.number,
                              validator: (String value){
                                if(value.isEmpty){
                                  return Strings.pleaseFillOutTheField;
                                }else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: Strings.amount,
                                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                                labelStyle: CustomStyle.textStyle,
                                filled: true,
                                fillColor: Colors.white,
                                hintStyle: CustomStyle.textStyle,
                                focusedBorder: CustomStyle.focusBorder,
                                enabledBorder: CustomStyle.focusErrorBorder,
                                focusedErrorBorder: CustomStyle.focusErrorBorder,
                                errorBorder: CustomStyle.focusErrorBorder,
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              height: 60,
                              width: 200,
                              decoration: BoxDecoration(
                                gradient: CustomColor.primaryButtonGradient,
                                borderRadius: BorderRadius.circular(Dimensions.radius),
                              ),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              /*Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                  PaymentPreviewScreen()));*/
                            },
                          )
                        ],
                      ),
                    ),
                  ],
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

  gatewayWidget(Gateway gateway) {
    return GestureDetector(
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 10,
              offset: Offset(1, 1), // Shadow position
            ),
          ],
        ),
        child: Image.asset(
            gateway.image
        ),
      ),
      onTap: () {
        _inputAmountDialog(context);
      },
    );
  }

}
