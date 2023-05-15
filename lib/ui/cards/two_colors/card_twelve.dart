import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_maker_designing_app/global/colors.dart';
import 'package:go_maker_designing_app/global/global_widgets.dart';
import 'package:go_maker_designing_app/global/size_config.dart';
import 'package:go_maker_designing_app/routes/app_pages.dart';

class CardTwelve extends StatefulWidget {
  const CardTwelve({Key? key}) : super(key: key);

  @override
  _CardTwelveState createState() => _CardTwelveState();
}

class _CardTwelveState extends State<CardTwelve> {
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
                        decoration: const BoxDecoration(
                          color: ColorsX.white
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: SizeConfig.screenWidth * .20,
                    width: SizeConfig.screenWidth * .40,
                    margin: EdgeInsets.only(top: SizeConfig.screenHeight * .20, right: 5),
                    child: Image.asset('assets/images/qrcode.png',
                      fit: BoxFit.contain,),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: SizeConfig.screenWidth * .35,
                    width: SizeConfig.screenWidth * .30,
                    margin: EdgeInsets.only(left: 20,top: 1, right: 5),
                    decoration: const BoxDecoration(
                      color: ColorsX.red_danger,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)
                      )
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: SizeConfig.screenWidth * .42),
                      child: globalWidgets.myText(context,
                          'Lorem Ipsum', ColorsX.black,
                          30, 0, 0, 0, FontWeight.w400, 18),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: SizeConfig.screenWidth * .42),
                      child: globalWidgets.myText(context,
                          'Software Developer', ColorsX.black,
                          5, 0, 0, 0, FontWeight.w400, 14),
                    ),

                    Container(
                      height: 1,
                      width:  SizeConfig.screenWidth,
                      margin: EdgeInsets.only(left: SizeConfig.screenWidth * .42, top: 15),
                      decoration: const BoxDecoration(
                        color: ColorsX.red_danger,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, left: SizeConfig.screenWidth * .42),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.email, color: ColorsX.black,),
                          SizedBox(width: 5,),
                          Container(

                            constraints: const BoxConstraints(
                                minHeight: 5, minWidth: 50, maxHeight: 80, maxWidth: 150),
                            child: globalWidgets.myText(context,
                                'lorem.ipsum@gmail.com', ColorsX.black,
                                0, 0, 0, 0, FontWeight.w400, 13),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: SizeConfig.screenWidth * .42),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.phone, color: ColorsX.black,),
                          SizedBox(width: 5,),
                          globalWidgets.myText(context,
                              '015773705450', ColorsX.black,
                              0, 0, 0, 0, FontWeight.w400, 13),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: SizeConfig.screenWidth * .42),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.location_city_outlined, color: ColorsX.black,),
                          SizedBox(width: 5,),
                          Container(
                            constraints: const BoxConstraints(
                                minHeight: 5, minWidth: 50, maxHeight: 80, maxWidth: 160),
                            child: globalWidgets.myText(context,
                                '96049 Bamberg, Dr.-Martinet-Str 3, Germany', ColorsX.black,
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
        Get.toNamed(Routes.CARD_TWELVE);
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
        Get.toNamed(Routes.CARD_THIRTEEN);
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
