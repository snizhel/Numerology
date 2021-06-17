import 'package:flutter/material.dart';

import 'package:elearn/utils/custom_color.dart';
import 'package:elearn/utils/dimensions.dart';
import 'package:elearn/utils/strings.dart';
import 'package:elearn/utils/custom_style.dart';
import 'package:elearn/widgets/back_widget.dart';
import 'package:elearn/screens/auth/otp/email_verification_screen.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _toggleVisibility = true;
  bool checkedValue = false;

  String selectedCounty = 'United States';
  Country _selected;

  List<String> genderList = ['Male', 'Female', 'Others'];
  String selectedGender;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedGender = genderList[0].toString();

  }
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
              BackWidget(title: Strings.createAnAccount,),
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
          top: Dimensions.topHeight,
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                headingWidget(context),
                SizedBox(height: Dimensions.heightSize * 2,),
                inputFieldWidget(context),
                termsCheckBoxWidget(context),
                signUpButton(context),
                SizedBox(height: Dimensions.heightSize * 2,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  headingWidget(BuildContext context) {
    return Image.asset(
        'assets/images/sign_in.png'
    );
  }

  inputFieldWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _titleData(Strings.firstName),
                        TextFormField(
                          style: CustomStyle.textStyle,
                          controller: firstNameController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (String value){
                            if(value.isEmpty){
                              return Strings.pleaseFillOutTheField;
                            }else{
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintText: Strings.demoFirstName,
                              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                              labelStyle: CustomStyle.textStyle,
                              filled: true,
                              fillColor: Colors.white,
                              hintStyle: CustomStyle.textStyle,
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: CustomColor.primaryColor,
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: Dimensions.widthSize * 2,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _titleData(Strings.lastName),
                        TextFormField(
                          style: CustomStyle.textStyle,
                          controller: lastNameController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (String value){
                            if(value.isEmpty){
                              return Strings.pleaseFillOutTheField;
                            }else{
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintText: Strings.demoLastName,
                              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                              labelStyle: CustomStyle.textStyle,
                              filled: true,
                              fillColor: Colors.white,
                              hintStyle: CustomStyle.textStyle,
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: CustomColor.primaryColor,
                              )
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _titleData(Strings.phoneNumber),
                        TextFormField(
                          style: CustomStyle.textStyle,
                          controller: phoneController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (String value){
                            if(value.isEmpty){
                              return Strings.pleaseFillOutTheField;
                            }else{
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintText: Strings.demoPhoneNumber,
                              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                              labelStyle: CustomStyle.textStyle,
                              filled: true,
                              fillColor: Colors.white,
                              hintStyle: CustomStyle.textStyle,
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: CustomColor.primaryColor,
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: Dimensions.widthSize * 2,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _titleData(Strings.gender),
                        Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: Dimensions.marginSize * 0.5, right: Dimensions
                                .marginSize * 0.5),
                            child: DropdownButton(
                              isExpanded: true,
                              underline: Container(),
                              hint: Text(
                                selectedGender,
                                style: CustomStyle.textStyle,
                              ), // Not necessary for Option 1
                              value: selectedGender,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedGender = newValue;
                                });
                              },
                              items: genderList.map((value) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    value,
                                    style: CustomStyle.textStyle,
                                  ),
                                  value: value,
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              _titleData(Strings.email),
              TextFormField(
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
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      color: CustomColor.primaryColor,
                    )
                ),
              ),
              _titleData(Strings.selectCountry),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(14.0),
                child: CountryPicker(
                  dense: false,
                  showFlag: false,  //displays flag, true by default
                  showDialingCode: false, //displays dialing code, false by default
                  showName: true, //displays country name, true by default
                  showCurrency: false, //eg. 'British pound'
                  showCurrencyISO: false, //eg. 'GBP'
                  onChanged: (Country country) {
                    setState(() {
                      _selected = country;
                      selectedCounty = _selected.name;
                    });
                  },
                  selectedCountry: _selected,
                  nameTextStyle: CustomStyle.textStyle,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black.withOpacity(0.7),
                      width: 1
                    )
                  ),
                ),
              ),
              _titleData(Strings.username),
              TextFormField(
                style: CustomStyle.textStyle,
                controller: usernameController,
                keyboardType: TextInputType.emailAddress,
                validator: (String value){
                  if(value.isEmpty){
                    return Strings.pleaseFillOutTheField;
                  }else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: Strings.demoUsername,
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    labelStyle: CustomStyle.textStyle,
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: CustomStyle.textStyle,
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: CustomColor.primaryColor,
                    )
                ),
              ),
              _titleData(Strings.password),
              TextFormField(
                style: CustomStyle.textStyle,
                controller: passwordController,
                validator: (String value){
                  if(value.isEmpty){
                    return Strings.pleaseFillOutTheField;
                  }else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: Strings.typePassword,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  labelStyle: CustomStyle.textStyle,
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: CustomStyle.textStyle,
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: CustomColor.primaryColor,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _toggleVisibility = !_toggleVisibility;
                      });
                    },
                    icon: _toggleVisibility
                        ? Icon(
                      Icons.visibility_off,
                      color: CustomColor.primaryColor,
                    )
                        : Icon(
                      Icons.visibility,
                      color: CustomColor.primaryColor,
                    ),
                  ),
                ),
                obscureText: _toggleVisibility,
              ),
              _titleData(Strings.confirmPassword),
              TextFormField(
                style: CustomStyle.textStyle,
                controller: confirmPasswordController,
                validator: (String value){
                  if(value.isEmpty){
                    return Strings.pleaseFillOutTheField;
                  }else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: Strings.typePassword,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  labelStyle: CustomStyle.textStyle,
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: CustomColor.primaryColor,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _toggleVisibility = !_toggleVisibility;
                      });
                    },
                    icon: _toggleVisibility
                        ? Icon(
                      Icons.visibility_off,
                      color: CustomColor.primaryColor,
                    )
                        : Icon(
                      Icons.visibility,
                      color: CustomColor.primaryColor,
                    ),
                  ),
                  hintStyle: CustomStyle.textStyle,
                ),
                obscureText: _toggleVisibility,
              ),
              SizedBox(height: Dimensions.heightSize),
            ],
          )
      ),
    );
  }

  termsCheckBoxWidget(BuildContext context) {
    return CheckboxListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "I accept the ",
            style: CustomStyle.textStyle,
          ),
          GestureDetector(
            child: Text(
              "Terms and Conditions",
              style: TextStyle(
                  fontSize: Dimensions.defaultTextSize,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.blueColor,
                  decoration: TextDecoration.underline
              ),
            ),
            onTap: () {
              print('go to privacy url');
              _showTermsConditions();
            },
          ),
        ],
      ),
      value: checkedValue,
      onChanged: (newValue) {
        setState(() {
          checkedValue = newValue;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
    );
  }

  signUpButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: GestureDetector(
        child: Container(
          height: Dimensions.buttonHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: CustomColor.primaryButtonGradient,
              borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius * 0.5))
          ),
          child: Center(
            child: Text(
              Strings.signUp.toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
              EmailVerificationScreen(emailAddress: emailController.text,)));
        },
      ),
    );
  }

  _titleData(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: Dimensions.heightSize * 0.1,
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

  Future<bool> _showTermsConditions() async {
    return (await showDialog(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: CustomColor.primaryColor,
        child: Stack(
          children: [
            Positioned(
                top: -35.0,
                left: -50.0,
                child: Image.asset(
                    'assets/images/splash_logo.png'
                )
            ),
            Positioned(
                right: -35.0,
                bottom: -20.0,
                child: Image.asset(
                    'assets/images/splash_logo.png'
                )
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: Dimensions.defaultPaddingSize * 2,
                  bottom: Dimensions.defaultPaddingSize * 2
              ),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: AlertDialog(
                    content: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 45,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: Dimensions.heightSize * 2,),
                                Text(
                                  Strings.ourPolicyTerms,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: Dimensions.largeTextSize,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: Dimensions.heightSize),
                                Text(
                                  'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
                                  style: CustomStyle.textStyle,
                                ),
                                SizedBox(height: Dimensions.heightSize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '•',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: CustomColor.accentColor,
                                          fontSize: Dimensions.extraLargeTextSize
                                      ),
                                    ),
                                    SizedBox(width: 5.0,),
                                    Expanded(
                                      child: Text(
                                        'simply random text. It has roots in a piece of classical Latin literature ',
                                        style: CustomStyle.textStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: Dimensions.heightSize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '•',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: CustomColor.accentColor,
                                          fontSize: Dimensions.extraLargeTextSize
                                      ),
                                    ),
                                    SizedBox(width: 5.0,),
                                    Expanded(
                                      child: Text(
                                        'Distracted by the readable content of a page when looking at its layout.',
                                        style: CustomStyle.textStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: Dimensions.heightSize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '•',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: CustomColor.accentColor,
                                          fontSize: Dimensions.extraLargeTextSize
                                      ),
                                    ),
                                    SizedBox(width: 5.0,),
                                    Expanded(
                                      child: Text(
                                        'Available, but the majority have suffered alteration',
                                        style: CustomStyle.textStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: Dimensions.heightSize * 2,),
                                Text(
                                  'When do we contact information ?',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: Dimensions.largeTextSize,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: Dimensions.heightSize),
                                Text(
                                  'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
                                  style: CustomStyle.textStyle,
                                ),
                                SizedBox(height: Dimensions.heightSize * 2,),
                                Text(
                                  'Do we use cookies ?',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: Dimensions.largeTextSize,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: Dimensions.heightSize),
                                Text(
                                  'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
                                  style: CustomStyle.textStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      height: 35.0,
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                          color: CustomColor.secondaryColor,
                                          borderRadius: BorderRadius.all(Radius.circular(5.0))
                                      ),
                                      child: Center(
                                        child: Text(
                                          Strings.decline,
                                          style: TextStyle(
                                              color: CustomColor.primaryColor,
                                              fontSize: Dimensions.defaultTextSize,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  SizedBox(width: 10.0,),
                                  GestureDetector(
                                    child: Container(
                                      height: 35.0,
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                          color: CustomColor.primaryColor,
                                          borderRadius: BorderRadius.all(Radius.circular(5.0))
                                      ),
                                      child: Center(
                                        child: Text(
                                          Strings.agree,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: Dimensions.defaultTextSize,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    )) ?? false;
  }

}
