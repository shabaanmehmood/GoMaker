import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_maker_designing_app/global/colors.dart';
import 'package:go_maker_designing_app/global/global_widgets.dart';
import 'package:go_maker_designing_app/global/size_config.dart';
import 'package:go_maker_designing_app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../global/global_variables.dart';

class CardThree extends StatefulWidget {
  const CardThree({Key? key}) : super(key: key);

  @override
  _CardThreeState createState() => _CardThreeState();
}

class _CardThreeState extends State<CardThree> {
  GlobalWidgets globalWidgets = GlobalWidgets();
  String name = '';
  String profession = '';
  String email = '';
  String contact_number = '';
  String address = '';
  String owner_name = '';
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: SizeConfig.screenHeight * .35,
                          width: SizeConfig.screenWidth * .50,
                          decoration: const BoxDecoration(
                            color: ColorsX.white,
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
                              // Container(
                              //   height: 110,
                              //   width: 110,
                              //   margin: EdgeInsets.only(top: 5),
                              //   child: Image.asset('assets/images/qrcode.png',
                              //     fit: BoxFit.contain,),
                              // ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: BarcodeWidget(
                                  color: ColorsX.white,
                                  barcode: Barcode.qrCode(
                                    errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                                  ),
                                  data: GlobalVariables.BUSINESS_ID == ''? 'https://google.com' : "${GlobalVariables.BUSINESS_ID}",
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.email, color: ColorsX.yellowColor,),
                                  SizedBox(width: 5,),
                                  Container(

                                    constraints: const BoxConstraints(
                                        minHeight: 5, minWidth: 50, maxHeight: 80, maxWidth: 150),
                                    child: globalWidgets.myTextRaleway(context,
                                        email == ''?'lorem.ipsum@gmail.com': email, ColorsX.yellowColor,
                                        0, 0, 0, 0, FontWeight.w400, 13),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.phone, color: ColorsX.yellowColor,),
                                  SizedBox(width: 5,),
                                  globalWidgets.myTextRaleway(context,
                                      contact_number==''?'015773705450':contact_number, ColorsX.yellowColor,
                                      0, 0, 0, 0, FontWeight.w400, 13),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.location_city, color: ColorsX.yellowColor,),
                                  SizedBox(width: 5,),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    constraints: const BoxConstraints(
                                        minHeight: 5, minWidth: 50, maxHeight: 80, maxWidth: 150),
                                    child: globalWidgets.myTextRaleway(context,
                                        address == '' ?'96049 Bamberg, Dr.-Martinet-Str 3, Germany' :
                                        address, ColorsX.yellowColor,
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
                  child: Image.asset('assets/images/person.png', fit: BoxFit.contain, height: 60,
                    width: 60,),
                  margin: EdgeInsets.only(top: 10, left: 5),
                ),
                Container(
                  height: SizeConfig.screenHeight * .12,
                  width: SizeConfig.screenWidth * .50,
                  margin: EdgeInsets.only(top: SizeConfig.screenHeight * .12),
                  decoration: const BoxDecoration(
                    color: ColorsX.light_orange,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: globalWidgets.myTextRaleway(context, owner_name == ''?'Lorem Ipsum' : owner_name, ColorsX.white,
                            0, 0, 0, 0, FontWeight.w700, 17),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: globalWidgets.myTextRaleway(context, profession == ''?'Software Developer': profession, ColorsX.white,
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
                backButton(context),
                nextButton(context),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                saveButton(context),
                customizeButton(context),
                editButton(context)
              ],
            ),
          ],
        ),
      ),
    );
  }

  saveButton(BuildContext context){
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
          child: globalWidgets.myText(context, 'Save', ColorsX.black,
              0, 0, 0, 0, FontWeight.w700, 18),
        ),
      ),
    );
  }
  customizeButton(BuildContext context){
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.CARD_TWO);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10,top: 10, left: 10),
        decoration: const BoxDecoration(
            color: ColorsX.black,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: globalWidgets.myText(context, 'Customize', ColorsX.white,
              0, 0, 0, 0, FontWeight.w700, 18),
        ),
      ),
    );
  }
  editButton(BuildContext context){
    return GestureDetector(
      onTap: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.getString('name');
        prefs.getString('profession');
        prefs.getString('email');
        prefs.getString('contact_number');
        prefs.getString('address');
        prefs.getString('owner_name');
        setState(() {
          name = "${prefs.getString('name')}";
          profession = "${prefs.getString('profession')}";
          email = "${prefs.getString('email')}";
          contact_number = "${prefs.getString('contact_number')}";
          address = "${prefs.getString('address')}";
          owner_name = "${prefs.getString('owner_name')}";
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10,top: 10, left: 10),
        decoration: const BoxDecoration(
            color: ColorsX.whatsappGreen,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: globalWidgets.myText(context, 'Edit', ColorsX.black,
              0, 0, 0, 0, FontWeight.w700, 18),
        ),
      ),
    );
  }
  backButton(BuildContext context){
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.CARD_TWO);
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
        Get.toNamed(Routes.CARD_FOUR);
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
