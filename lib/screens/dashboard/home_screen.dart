import 'package:elearn/data/category.dart';
import 'package:elearn/data/instructor.dart';
import 'package:elearn/data/latest_course.dart';
import 'package:elearn/data/best_seller.dart';
import 'package:elearn/screens/auth/sign_in_screen.dart';
import 'package:elearn/utils/custom_color.dart';
import 'package:elearn/utils/custom_style.dart';
import 'package:elearn/utils/dimensions.dart';
import 'package:elearn/utils/strings.dart';
import 'package:elearn/widgets/circle_button_widget.dart';
import 'package:elearn/widgets/drawer_header_widget.dart';
import 'package:elearn/widgets/list_data_widget.dart';
import 'package:elearn/widgets/my_rating.dart';
import 'package:flutter/material.dart';
import 'package:elearn/screens/category_details_screen.dart';
import 'package:elearn/screens/course_details_screen.dart';
import 'package:elearn/screens/drawer/messaging_screen.dart';
import 'package:elearn/screens/drawer/change_password_screen.dart';
import 'package:elearn/screens/drawer/my_coupon_screen.dart';
import 'package:elearn/screens/drawer/my_wallet_screen.dart';
import 'package:elearn/screens/filter_screen.dart';
import 'package:elearn/screens/my_course_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController searchController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: Container(
            color: CustomColor.primaryColor,
            child: ListView(
              children: <Widget>[
                Container(
                  height: 200,
                  child: DrawerHeader(
                    child: DrawerHeaderWidget(),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                ListDataWidget(
                  icon: 'assets/images/icon/coupon.png',
                  title: Strings.myCoupon,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                        MyCouponScreen()));
                  },
                ),
                ListDataWidget(
                  icon: 'assets/images/icon/wallet.png',
                  title: Strings.myWallet,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                        MyWalletScreen()));
                  },
                ),
                ListDataWidget(
                  icon: 'assets/images/icon/settings.png',
                  title: Strings.changePassword,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                        ChangePasswordScreen
                      ()));
                  },
                ),
                ListDataWidget(
                  icon: 'assets/images/icon/help.png',
                  title: Strings.helpSupport,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                    MessagingScreen()));
                  },
                ),
                ListDataWidget(
                  icon: 'assets/images/icon/logout.png',
                  title: Strings.signOut,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              headerWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  headerWidget(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/home_bg.png',
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          color: CustomColor.primaryColor.withOpacity(0.8),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Dimensions.heightSize,),
              Padding(
                padding: const EdgeInsets.only(
                  left: Dimensions.marginSize,
                  right: Dimensions.marginSize,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: Container(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                          'assets/images/icon/menu.png'
                        ),
                      ),
                      onTap: () {
                        if(scaffoldKey.currentState.isDrawerOpen){
                          scaffoldKey.currentState.openEndDrawer();
                        }else{
                          scaffoldKey.currentState.openDrawer();
                        }
                      },
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: Dimensions.marginSize,
                          right: Dimensions.marginSize,
                        ),
                        child: Text(
                          Strings.growYourOwnSkillByOnlineLearning,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.extraLargeTextSize * 1.5
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    CircleButtonWidget(
                      icon: 'assets/images/icon/wallet.png',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                            MyCourseScreen()));
                      },
                    )
                  ],
                ),
              ),
              SizedBox(height: Dimensions.heightSize,),
              Padding(
                padding: const EdgeInsets.only(
                  left: Dimensions.marginSize,
                  right: Dimensions.marginSize,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        style: CustomStyle.textStyle,
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        validator: (String value){
                          if(value.isEmpty){
                            return Strings.pleaseFillOutTheField;
                          }else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: Strings.searchResult,
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                          labelStyle: CustomStyle.textStyle,
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: CustomStyle.textStyle,
                          focusedBorder: CustomStyle.focusBorder,
                          enabledBorder: CustomStyle.focusErrorBorder,
                          focusedErrorBorder: CustomStyle.focusErrorBorder,
                          errorBorder: CustomStyle.focusErrorBorder,
                          suffixIcon: GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: CustomColor.primaryColor,
                                  borderRadius: BorderRadius.circular(Dimensions.radius),
                                  boxShadow: [
                                    BoxShadow(
                                      color: CustomColor.primaryColor.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 0), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onTap: () {

                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: Dimensions.widthSize,),
                    GestureDetector(
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          gradient: CustomColor.primaryButtonGradient,
                          borderRadius: BorderRadius.circular(Dimensions.radius),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColor.accentColor.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Image.asset(
                            'assets/images/icon/filtter.png'
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                        FilterScreen()));
                      },
                    )
                  ],
                ),
              ),
              SizedBox(height: Dimensions.heightSize * 2,),
              bodyWidget(context)
            ],
          ),
        ),
      ],
    );
  }

  bodyWidget(BuildContext context) {
    return Column(
      children: [
        _categoryWidget(context),
        _ourInstructorsWidget(context),
        _latestCoursesWidget(context),
        _weeklyBestSellerWidget(context),
        SizedBox(height: Dimensions.heightSize,)
      ],
    );
  }

  _categoryWidget(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        itemCount: CategoryList.list().length,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Category category = CategoryList.list()[index];
          return Padding(
            padding: const EdgeInsets.only(
              left: Dimensions.marginSize,
            ),
            child: Row(
              children: [
                GestureDetector(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: category.color,
                        borderRadius: BorderRadius.circular(Dimensions.radius)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          category.image,
                          height: 60,
                          width: 60,
                        ),
                        Text(
                          category.name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                    CategoryDetailsScreen(category: category.name,)));
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _ourInstructorsWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleData(Strings.ourInstructors),
        Container(
          height: 150,
          color: Colors.white,
          child: ListView.builder(
            itemCount: InstructorList.list().length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Instructor instructor = InstructorList.list()[index];
              return Padding(
                padding: const EdgeInsets.only(
                  left: Dimensions.marginSize,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      instructor.image,
                      height: 60,
                      width: 60,
                    ),
                    SizedBox(height: Dimensions.heightSize * 0.5,),
                    Text(
                      instructor.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        fontSize: Dimensions.largeTextSize
                      ),
                    ),
                    Text(
                      instructor.expert,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                    MyRating(rating: instructor.rating,)
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  _latestCoursesWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleData(Strings.latestCourses),
        Container(
          height: 220,
          child: ListView.builder(
            itemCount: LatestCourseList.list().length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              LatestCourse latest = LatestCourseList.list()[index];
              return Padding(
                padding: const EdgeInsets.only(
                  left: Dimensions.marginSize,
                  bottom: Dimensions.heightSize
                ),
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                  child: GestureDetector(
                    child: Container(
                      width: 180,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Dimensions.radius),
                                topRight: Radius.circular(Dimensions.radius),
                              ),
                              child: Image.asset(
                                latest.image,
                                //height: 120,
                                width: 180,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(height: Dimensions.heightSize),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Text(
                                latest.name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.largeTextSize
                                ),
                                maxLines: 2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Text(
                                latest.instructor,
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
                                    latest.rating.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Dimensions.largeTextSize
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '\$${latest.price.toString()}',
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
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                      CourseDetailsScreen(title: latest.name,)));
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  _weeklyBestSellerWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleData(Strings.weeklyBestSeller),
        Container(
          height: 300,
          child: ListView.builder(
            itemCount: BestSellerList.list().length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              BestSeller best = BestSellerList.list()[index];
              return Padding(
                padding: const EdgeInsets.only(
                  left: Dimensions.marginSize,
                  bottom: Dimensions.heightSize
                ),
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                  child: GestureDetector(
                    child: Container(
                      width: 260,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radius),
                              topRight: Radius.circular(Dimensions.radius),
                            ),
                            child: Image.asset(
                              best.image,
                              width: 260,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(height: Dimensions.heightSize),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: Text(
                              best.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.largeTextSize
                              ),
                              maxLines: 2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: Text(
                              best.instructor,
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
                                  best.rating.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Dimensions.largeTextSize
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  '\$${best.price.toString()}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Dimensions.largeTextSize
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ListTile(
                            leading: Image.asset(
                              'assets/images/profile.png',
                              height: 40,
                              width: 40,
                            ),
                            title: Text(
                              Strings.demoName,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            subtitle: Text(
                              'Instructor',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                          CourseDetailsScreen(title: best.name,)));
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  _titleData(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimensions.heightSize,
        left: Dimensions.marginSize,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: Dimensions.extraLargeTextSize * 1.2
        ),
      ),
    );
  }
}
