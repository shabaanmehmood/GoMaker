import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_maker_designing_app/global/global_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';
import '../../global/colors.dart';
import '../../global/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseMessaging? messaging;
  GlobalWidgets globalWidgets = GlobalWidgets();
  // This widget is the root of your application.

  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messaging = FirebaseMessaging.instance;
    messaging?.getToken().then((value) {
      print(value);
      saveTokenInLocal(value);
    });
    checkWhereToGo();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Opacity(
              opacity: 0.85,
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.contain,
              )
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: globalWidgets.myText(context, "GoMaker", ColorsX.light_orange,
          //     SizeConfig.screenHeight*.07, 0, 0, 10, FontWeight.w600, 22.0,),
          // ),
          animatedTextLogo(),
          animatedTextDetail(),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: globalWidgets.myText(context, "Business Card Designing App", ColorsX.greenish,
          //     SizeConfig.screenHeight*.001, 0, 0, 10, FontWeight.w500, 16.0,),
          // ),
        ],
      ),
    );
  }

  animatedTextLogo(){
    const colorizeTextStyle = TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Horizon',
    );
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 250.0,
        child: AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              'GoMaker',
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
            ),
          ],
          isRepeatingAnimation: true,
          onTap: () {
            print("Tap Event");
          },
        ),
      ),
    );
  }
  animatedTextDetail(){
    const colorizeTextStyle = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'Horizon',
    );
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 250.0,
        child: AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              'Business Card Designing App',
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
            ),
          ],
          isRepeatingAnimation: true,
          onTap: () {
            print("Tap Event");
          },
        ),
      ),
    );
  }

  myText(BuildContext context, String text, Color colorsX, double top, double left, double right, double bottom,
      FontWeight fontWeight, double fontSize){
    return Container(
      margin: EdgeInsets.only(top: top, left: left, right: right, bottom: bottom),
      child: Text(text, style: GoogleFonts.mukta(textStyle: TextStyle( color: colorsX, fontWeight: fontWeight,
          fontSize: fontSize)),),
    );
  }
  checkWhereToGo() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if((prefs.getString('id') == null || (prefs.getString('caste') == null)
        || (prefs.getString('id') == '') || (prefs.getString('caste') == ''))){
      Timer(
          Duration(seconds: 4),
              () => Get.toNamed(Routes.LOGIN_SCREEN));
    }
    // else{
    //   GlobalVariables.my_ID = "${prefs.getString('id')}";
    //   Timer(
    //       Duration(seconds: 3),
    //           () => Get.toNamed(Routes.ALL_CASTES_MAIN_PAGE));
    // }
  }
  void saveTokenInLocal(String? value)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', "${value}");
    print('TOKEN STORED '+ "${value}");
  }
}
