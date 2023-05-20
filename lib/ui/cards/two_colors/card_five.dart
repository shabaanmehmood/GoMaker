import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_maker_designing_app/global/colors.dart';
import 'package:go_maker_designing_app/global/global_widgets.dart';
import 'package:go_maker_designing_app/global/size_config.dart';
import 'package:go_maker_designing_app/routes/app_pages.dart';

class CardFive extends StatefulWidget {
  const CardFive({Key? key}) : super(key: key);

  @override
  _CardFiveState createState() => _CardFiveState();
}

class _CardFiveState extends State<CardFive> {
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
                        height: SizeConfig.screenHeight * .27,
                        width: SizeConfig.screenWidth,
                        decoration: const BoxDecoration(
                          color: ColorsX.creamColor,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: SizeConfig.screenHeight * .08,
                        width: SizeConfig.screenWidth,
                        // margin: EdgeInsets.only(top: SizeConfig.screenHeight * .12),
                        decoration: const BoxDecoration(
                          // borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: ColorsX.black,
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
                    margin: EdgeInsets.only(top: 10, right: 5),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 90,
                    width: 90,
                    margin: EdgeInsets.only(top: SizeConfig.screenHeight * .11, right: 5),
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
                            5, 0, 0, 0, FontWeight.w400, 18),
                        SizedBox(width: 20,),
                        globalWidgets.myTextSerif(context,
                            'Software Developer', ColorsX.white,
                            5, 0, 0, 0, FontWeight.w400, 14),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
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
                      margin: EdgeInsets.only(top: 10),
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
                      margin: EdgeInsets.only(top: 10),
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
        Get.toNamed(Routes.CARD_FIVE);
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
        Get.toNamed(Routes.CARD_SIX);
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
