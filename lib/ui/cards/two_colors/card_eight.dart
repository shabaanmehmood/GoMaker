import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_maker_designing_app/global/colors.dart';
import 'package:go_maker_designing_app/global/global_widgets.dart';
import 'package:go_maker_designing_app/global/size_config.dart';
import 'package:go_maker_designing_app/routes/app_pages.dart';

class CardEight extends StatefulWidget {
  const CardEight({Key? key}) : super(key: key);

  @override
  _CardEightState createState() => _CardEightState();
}

class _CardEightState extends State<CardEight> {
  GlobalWidgets globalWidgets = GlobalWidgets();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Center(
                      child: Container(
                        height: SizeConfig.screenHeight * .35,
                        width: SizeConfig.screenWidth,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.green.shade900,
                              Colors.green.shade100,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    child: Image.asset('assets/images/person.png', fit: BoxFit.contain, height: 60,
                      width: 60,),
                    margin: EdgeInsets.only(top: 30, right: 5),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 90,
                    width: 90,
                    margin: EdgeInsets.only(top: SizeConfig.screenHeight * .14, right: 5),
                    child: Image.asset('assets/images/qrcode.png',
                      fit: BoxFit.contain,),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        globalWidgets.myTextSerif(context,
                            'Lorem Ipsum', ColorsX.white,
                            30, 5, 0, 0, FontWeight.w400, 18),
                        SizedBox(width: 20,),
                        globalWidgets.myTextSerif(context,
                            'Software Developer', ColorsX.white,
                            30, 0, 0, 0, FontWeight.w400, 14),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 35, left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.email, color: ColorsX.white,),
                          SizedBox(width: 5,),
                          Container(

                            constraints: const BoxConstraints(
                                minHeight: 5, minWidth: 50, maxHeight: 80, maxWidth: 150),
                            child: globalWidgets.myTextSerif(context,
                                'lorem.ipsum@gmail.com', ColorsX.white,
                                0, 0, 0, 0, FontWeight.w400, 13),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.phone, color: ColorsX.white,),
                          SizedBox(width: 5,),
                          globalWidgets.myTextSerif(context,
                              '015773705450', ColorsX.white,
                              0, 0, 0, 0, FontWeight.w400, 13),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.location_city_outlined, color: ColorsX.white,),
                          SizedBox(width: 5,),
                          Container(
                            constraints: const BoxConstraints(
                                minHeight: 5, minWidth: 50, maxHeight: 80, maxWidth: 200),
                            child: globalWidgets.myTextSerif(context,
                                '96049 Bamberg, Dr.-Martinet-Str 3, Germany', ColorsX.white,
                                0, 0, 0, 0, FontWeight.w400, 13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                backButton(context),
                nextButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  backButton(BuildContext context){
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.CARD_EIGHT);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, top: 10),
        decoration: const BoxDecoration(
            color: ColorsX.whatsappGreen,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: globalWidgets.myText(context, 'Back', ColorsX.white,
              0, 0, 0, 0, FontWeight.w700, 18),
        ),
      ),
    );
  }
  nextButton(BuildContext context){
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.CARD_NINE);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10,top: 10, left: 10),
        decoration: const BoxDecoration(
            color: ColorsX.whatsappGreen,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: globalWidgets.myText(context, 'Next', ColorsX.black,
              0, 0, 0, 0, FontWeight.w700, 18),
        ),
      ),
    );
  }
}
