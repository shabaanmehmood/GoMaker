import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_maker_designing_app/global/colors.dart';
import 'package:go_maker_designing_app/global/global_widgets.dart';
import 'package:go_maker_designing_app/global/size_config.dart';
import 'package:go_maker_designing_app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../global/global_variables.dart';

class CardFive extends StatefulWidget {
  const CardFive({Key? key}) : super(key: key);

  @override
  _CardFiveState createState() => _CardFiveState();
}

class _CardFiveState extends State<CardFive> {
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
                    child: BarcodeWidget(
                    barcode: Barcode.qrCode(
                      errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                    ),
                    data: GlobalVariables.BUSINESS_ID == ''? 'https://google.com' : "${GlobalVariables.BUSINESS_ID}",
                    width: 90,
                    height: 90,
                  ),
                ),),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        globalWidgets.myTextSerif(context,
                            owner_name == ''?'Lorem Ipsum' : owner_name, ColorsX.white,
                            5, 0, 0, 0, FontWeight.w400, 18),
                        SizedBox(width: 20,),
                        globalWidgets.myTextSerif(context,
                            profession == ''?'Software Developer': profession, ColorsX.white,
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
                                email == ''?'lorem.ipsum@gmail.com': email, ColorsX.white,
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
                              contact_number==''?'015773705450':contact_number, ColorsX.white,
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
                                address == '' ?'96049 Bamberg, Dr.-Martinet-Str 3, Germany' :
                                address, ColorsX.white,
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
            Visibility(
              visible: GlobalVariables.BUSINESS_ID != '' && GlobalVariables.my_ID == '',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  saveButton(context),
                  customizeButton(context),
                  editButton(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  backButton(BuildContext context){
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.CARD_FOUR);
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
}
