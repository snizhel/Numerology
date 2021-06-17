import 'package:elearn/utils/dimensions.dart';
import 'package:elearn/widgets/back_widget.dart';
import 'package:flutter/material.dart';
import 'package:elearn/data/category_details.dart';

class CategoryDetailsScreen extends StatefulWidget {
  final String category;

  const CategoryDetailsScreen({Key key, this.category}) : super(key: key);

  @override
  _CategoryDetailsScreenState createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              BackWidget(title: widget.category,),
              bodyWidget(context)
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
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius * 2 ),
            topRight: Radius.circular(Dimensions.radius * 2 ),
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: Dimensions.heightSize
          ),
          child: GridView.count(
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: List<Widget>.generate(CategoryDetailsList.list().length, (index) {
              CategoryDetails details = CategoryDetailsList.list()[index];
              return Padding(
                padding: const EdgeInsets.only(
                    //top: Dimensions.heightSize,
                  left: Dimensions.widthSize,
                  right: Dimensions.widthSize,
                ),
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                  child: Container(
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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

                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Text(
                            details.name,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.largeTextSize
                            ),
                            maxLines: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Text(
                            details.instructor,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 15,
                              ),
                              Text(
                                details.rating.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.largeTextSize
                                ),
                              ),
                              Spacer(),
                              Text(
                                '\$${details.price.toString()}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.largeTextSize
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            })
          ),
        ),
      ),
    );
  }
}
