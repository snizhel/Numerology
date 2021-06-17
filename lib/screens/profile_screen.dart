import 'package:flutter/material.dart';

import 'package:elearn/utils/custom_color.dart';
import 'package:elearn/utils/dimensions.dart';
import 'package:elearn/utils/strings.dart';
import 'package:elearn/utils/custom_style.dart';
import 'package:elearn/widgets/back_widget.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  bool isEdit = true;

  File _image;
  final picker = ImagePicker();

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
              BackWidget(title: Strings.profile,),
              bodyWidget(context)
            ],
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
            top: Dimensions.topHeight
        ),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius * 2),
                topRight: Radius.circular(Dimensions.radius * 2),
              )
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              headingWidget(context),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      courseWidget(context),
                      inputFiledWidget(context),
                      SizedBox(height: Dimensions.heightSize * 2),
                      buttonWidget(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  headingWidget(BuildContext context) {
    return Positioned(
      top: -50,
      left: 0,
      right: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                _image == null ? Image.asset(
                  'assets/images/instructor/1.png',
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                )
                  : Image.file(
                    _image,
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                ),
                Positioned(
                  right: -5,
                  bottom: 0,
                  child: GestureDetector(
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: CustomColor.primaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    onTap: () {
                      _openImageSourceOptions(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  inputFiledWidget(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(
              top: Dimensions.heightSize * 2,
              left: Dimensions.marginSize,
              right: Dimensions.marginSize
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _titleData(Strings.fullName),
              TextFormField(
                readOnly: isEdit,
                style: CustomStyle.textStyle,
                controller: emailController,
                keyboardType: TextInputType.name,
                validator: (String value){
                  if(value.isEmpty){
                    return Strings.pleaseFillOutTheField;
                  }else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: Strings.demoName,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  labelStyle: CustomStyle.textStyle,
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: CustomStyle.textStyle,
                ),
              ),
              _titleData(Strings.email),
              TextFormField(
                readOnly: isEdit,
                style: CustomStyle.textStyle,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (String value){
                  if(value.isEmpty){
                    return Strings.pleaseFillOutTheField;
                  }else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: Strings.demoEmail,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  labelStyle: CustomStyle.textStyle,
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: CustomStyle.textStyle,
                ),
              ),
              _titleData(Strings.address),
              TextFormField(
                readOnly: isEdit,
                style: CustomStyle.textStyle,
                controller: addressController,
                keyboardType: TextInputType.text,
                validator: (String value){
                  if(value.isEmpty){
                    return Strings.pleaseFillOutTheField;
                  }else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: Strings.demoAddress,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  labelStyle: CustomStyle.textStyle,
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: CustomStyle.textStyle,
                ),
              ),
              SizedBox(height: Dimensions.heightSize),
            ],
          ),
        )
    );
  }

  buttonWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: GestureDetector(
        child: Container(
          height: Dimensions.buttonHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: isEdit ? Colors.grey : CustomColor.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
          ),
          child: Center(
            child: Text(
              isEdit ? Strings.edit.toUpperCase() : Strings.update.toUpperCase(),
              style: TextStyle(
                  color: isEdit ? Colors.black : Colors.white,
                  fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        onTap: () {
          setState(() {
            isEdit = !isEdit;
          });
        },
      ),
    );
  }

  _titleData(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: Dimensions.heightSize * 0.5,
        top: Dimensions.heightSize,
      ),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.black
        ),
      ),
    );
  }

  _openImageSourceOptions(BuildContext context){
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
                height: 150,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Icon(Icons.camera_alt, size: 40.0, color: Colors.blue,),
                          onTap: (){
                            Navigator.of(context).pop();
                            _chooseFromCamera();
                          },
                        ),
                        Text(
                          Strings.takePhoto,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.defaultTextSize
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Icon(Icons.photo, size: 40.0, color: Colors.green,),
                          onTap: (){
                            Navigator.of(context).pop();
                            _chooseFromGallery();
                          },
                        ),
                        Text(
                          Strings.fromGallery,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.defaultTextSize
                          ),
                        )
                      ],
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

  Future _chooseFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future _chooseFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  courseWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
        top: Dimensions.heightSize * 2
      ),
      child: Row(
        children: [
          _courseData(Strings.totalCourse, '75+', 0xffFF7438),
          SizedBox(width: Dimensions.widthSize,),
          _courseData(Strings.completeCourse, '68', 0xff078C73),
        ],
      ),
    );
  }

  _courseData(String title, String value, int color) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            color: Color(color).withOpacity(0.2),
          borderRadius: BorderRadius.circular(Dimensions.radius)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.largeTextSize,
                color: Colors.black
              ),
            ),
            SizedBox(height: Dimensions.heightSize * 0.5,),
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.extraLargeTextSize * 1.5,
                color: Color(color)
              ),
            ),
          ],
        ),
      ),
    );
  }

}
