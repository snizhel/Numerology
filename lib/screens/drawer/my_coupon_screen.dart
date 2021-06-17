import 'package:elearn/data/coupon.dart';
import 'package:elearn/widgets/back_widget.dart';
import 'package:flutter/material.dart';

import 'package:elearn/utils/dimensions.dart';
import 'package:elearn/utils/strings.dart';
import 'package:elearn/utils/custom_color.dart';

class MyCouponScreen extends StatefulWidget {
  @override
  _MyCouponScreenState createState() => _MyCouponScreenState();
}

class _MyCouponScreenState extends State<MyCouponScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.secondaryColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              BackWidget(title: Strings.myCoupon,),
              bodyWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: Dimensions.topHeight,
      ),
      child: Container(
        //height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius * 2),
            topRight: Radius.circular(Dimensions.radius * 2),
          )
        ),
        child: ListView.builder(
          itemCount: CouponList.list().length,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            Coupon details = CouponList.list()[index];
            return Padding(
              padding: const EdgeInsets.only(
                top: Dimensions.heightSize,
                left: Dimensions.widthSize,
                right: Dimensions.widthSize,
              ),
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(Dimensions.radius),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius),
                        topRight: Radius.circular(Dimensions.radius),
                      ),
                      child: Image.asset(
                        details.image,
                        //height: 120,
                        width: 180,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: Dimensions.marginSize,
                          right: Dimensions.marginSize,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$${details.discount} OFF',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.largeTextSize
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              details.title,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Coupon Number: ${details.voucher}',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
