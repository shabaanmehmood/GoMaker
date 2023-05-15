import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_maker_designing_app/global/colors.dart';
import 'package:go_maker_designing_app/global/global_widgets.dart';
import 'package:go_maker_designing_app/global/size_config.dart';
import 'package:go_maker_designing_app/routes/app_pages.dart';

class CardOne extends StatefulWidget {
  const CardOne({Key? key}) : super(key: key);

  @override
  _CardOneState createState() => _CardOneState();
}

class _CardOneState extends State<CardOne> {
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
                Center(
                  child: Container(
                    height: SizeConfig.screenHeight * .35,
                    width: SizeConfig.screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: SizeConfig.screenHeight * .35,
                          width: SizeConfig.screenWidth * .50,
                          decoration: const BoxDecoration(
                            color: ColorsX.white,
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 130,
                                width: 130,
                                child: Image.asset('assets/images/qr_image.png',
                                fit: BoxFit.contain,),
                              ),
                              globalWidgets.myTextRaleway(context,
                                  'lorem ipsum ist nicht', ColorsX.light_orange,
                                  0, 0, 0, 0, FontWeight.w600, 13),
                            ],
                          ),
                        ),
                        Container(
                          height: SizeConfig.screenHeight * .35,
                          width: SizeConfig.screenWidth * .50,
                          decoration: const BoxDecoration(
                            color: ColorsX.black,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.email, color: ColorsX.white,),
                                  Container(

                                    constraints: const BoxConstraints(
                                        minHeight: 5, minWidth: 50, maxHeight: 80, maxWidth: 150),
                                    child: globalWidgets.myTextRaleway(context,
                                        'lorem.ipsum@gmail.com', ColorsX.white,
                                        0, 0, 0, 0, FontWeight.w400, 13),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.phone, color: ColorsX.white,),
                                  globalWidgets.myTextRaleway(context,
                                      '015773705450', ColorsX.white,
                                      0, 0, 0, 0, FontWeight.w400, 13),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.screenHeight * .19,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.location_city, color: ColorsX.white,),
                                  Container(

                                    constraints: const BoxConstraints(
                                        minHeight: 5, minWidth: 50, maxHeight: 80, maxWidth: 150),
                                    child: globalWidgets.myTextRaleway(context,
                                        'Your address here. Your address here', ColorsX.white,
                                        0, 0, 0, 0, FontWeight.w400, 13),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: SizeConfig.screenHeight * .12,
                  width: SizeConfig.screenWidth * .50,
                  margin: EdgeInsets.only(top: SizeConfig.screenHeight * .11, left: SizeConfig.screenWidth *.50),
                  decoration: const BoxDecoration(
                    // borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: ColorsX.light_orange,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: globalWidgets.myTextRaleway(context, 'Lorem Ipsum', ColorsX.white,
                            0, 0, 0, 0, FontWeight.w700, 17),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: globalWidgets.myTextRaleway(context, 'Software Engineer', ColorsX.white,
                            10, 0, 0, 0, FontWeight.w700, 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                nextButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  nextButton(BuildContext context){
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.CARD_TWO);
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
