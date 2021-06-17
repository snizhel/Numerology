import 'package:flutter/material.dart';
import 'package:elearn/utils/custom_color.dart';
import 'package:elearn/utils/dimensions.dart';

class SuccessDialog extends StatefulWidget {
  final String title, subTitle, buttonName;
  final GestureTapCallback onTap;
  const SuccessDialog({Key key, this.title, this.subTitle, this.buttonName, this.onTap}) : super(key:
key);

  @override
  _SuccessDialogState createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
                'assets/images/payment_success.png',
              height: 150,
              width: 200,
            ),
            Image.asset(
              'assets/images/tik.png',
              height: 80,
              width: 80,
            ),
            Text(
              '${widget.title}!!',
              style: TextStyle(
                  fontSize: Dimensions.extraLargeTextSize,
                  color: CustomColor.primaryColor,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              widget.subTitle,
              style: TextStyle(
                  fontSize: Dimensions.largeTextSize,
                  color: CustomColor.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              child: Container(
                height: Dimensions.buttonHeight,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: CustomColor.primaryButtonGradient,
                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
                ),
                child: Center(
                  child: Text(
                    widget.buttonName.toUpperCase(),
                    style: TextStyle(
                        fontSize: Dimensions.extraLargeTextSize,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              onTap: widget.onTap,
            ),
          ],
        ),
      ),

    );
  }

}
