import 'package:elearn/data/tutorial.dart';
import 'package:elearn/screens/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:elearn/utils/dimensions.dart';
import 'package:elearn/utils/custom_style.dart';

class ModulesWidget extends StatefulWidget {
  @override
  _ModulesWidgetState createState() => _ModulesWidgetState();
}

class _ModulesWidgetState extends State<ModulesWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize,
          top: Dimensions.heightSize),
      child: tutorialWidget(context),
    );
  }

  tutorialWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tutorial',
          style: TextStyle(
              color: Colors.black,
              fontSize: Dimensions.defaultTextSize,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: Dimensions.heightSize,),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: 4,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return Card(
                  elevation: 1,
                  child: ExpansionTile(
                    backgroundColor: Colors.white,
                    title: Text(
                      'Class 0${(index+1).toString()}. ',
                      style: CustomStyle.textStyle,
                    ),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions
                            .marginSize, bottom:
                        Dimensions.heightSize),
                        child:  ListView.builder(
                          itemCount: TutorialList.list().length,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            Tutorial tutorial = TutorialList.list()[index];
                            return ListTile(
                              title: Row(
                                children: [
                                  Icon(
                                      Icons.play_circle_fill,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: Dimensions.widthSize,),
                                  Text(
                                    tutorial.name,
                                    style: CustomStyle.textStyle,
                                  ),
                                  Spacer(),
                                  tutorial.isFree ? Row(
                                    children: [
                                      Text(
                                        'Premium',
                                        style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontSize: Dimensions.defaultTextSize,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(width: Dimensions.widthSize,),
                                      Image.asset(
                                        'assets/images/premium_service.png'
                                      )
                                    ],
                                  )
                                      : Text(
                                    'Free',
                                    style: TextStyle(
                                        color: Colors.cyan,
                                        fontSize: Dimensions.defaultTextSize,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)
                                => VideoPlayerScreen()));
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
          ),
        )
      ],
    );
  }
}
