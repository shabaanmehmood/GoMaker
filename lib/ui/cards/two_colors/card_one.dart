import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_maker_designing_app/global/colors.dart';
import 'package:go_maker_designing_app/global/global_variables.dart';
import 'package:go_maker_designing_app/global/global_widgets.dart';
import 'package:go_maker_designing_app/global/size_config.dart';
import 'package:go_maker_designing_app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardOne extends StatefulWidget {
  const CardOne({Key? key}) : super(key: key);

  @override
  _CardOneState createState() => _CardOneState();
}

class _CardOneState extends State<CardOne> {
  GlobalWidgets globalWidgets = GlobalWidgets();
  String name = '';
  String profession = '';
  String email = '';
  String contact_number = '';
  String address = '';
  String owner_name = '';
  String id = '';
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
                                  child: Image.asset('assets/images/person.png', fit: BoxFit.contain, height: 60,
                                    width: 60,),
                                margin: EdgeInsets.only(top: 10),
                              ),
                              // Container(
                              //   height: 130,
                              //   width: 130,
                              //   child: Image.asset('assets/images/qr_image.png',
                              //   fit: BoxFit.contain,),
                              // ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: BarcodeWidget(
                                  barcode: Barcode.qrCode(
                                    errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                                  ),
                                  data: GlobalVariables.BUSINESS_ID == ''? 'https://google.com' : "${GlobalVariables.BUSINESS_ID}",
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                              globalWidgets.myTextRaleway(context,
                                  name == ''?'lorem ipsum ist nicht' : name, ColorsX.light_orange,
                                  10, 0, 0, 0, FontWeight.w600, 13),

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
                                        email == ''? 'lorem.ipsum@gmail.com' : email, ColorsX.white,
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
                                      contact_number == ''?'015773705450':contact_number, ColorsX.white,
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
                                        address == ''?'Your address here. Your address here':address, ColorsX.white,
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
                        child: globalWidgets.myTextRaleway(context, owner_name==''?'Lorem Ipsum':owner_name, ColorsX.white,
                            0, 0, 0, 0, FontWeight.w700, 17),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: globalWidgets.myTextRaleway(context, profession == ''?'Software Engineer':profession, ColorsX.white,
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
            Visibility(
              visible: GlobalVariables.BUSINESS_ID != '' && GlobalVariables.my_ID == '',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  saveButton(context),
                  customizeButton(context),
                  editButton(context),
                ],
              ),
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
        debugPrint("${prefs.getString('id')}");
        setState(() {
          name = "${prefs.getString('name')}";
          profession = "${prefs.getString('profession')}";
          email = "${prefs.getString('email')}";
          contact_number = "${prefs.getString('contact_number')}";
          address = "${prefs.getString('address')}";
          owner_name = "${prefs.getString('owner_name')}";
          id = "${prefs.getString('id')}";
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
