import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../global/colors.dart';
import '../../global/global_variables.dart';
import '../../global/global_widgets.dart';
import '../../global/size_config.dart';
import '../../routes/app_pages.dart';

class RegisterCustomer extends StatefulWidget {
  const RegisterCustomer({Key? key}) : super(key: key);

  @override
  _RegisterCustomerState createState() => _RegisterCustomerState();
}

class _RegisterCustomerState extends State<RegisterCustomer> {
  TextEditingController emailCtl = new TextEditingController();
  TextEditingController passwordCtl = new TextEditingController();
  TextEditingController nameCtl = new TextEditingController();
  static String cityValue = "Select City";
  GlobalWidgets globalWidgets = GlobalWidgets();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: body(context),
      ),
    );
  }

  body(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      color:  const Color(0xffffffff).withOpacity(0.8),
      // decoration: const BoxDecoration(
      //   color:  const Color(0xff969B9B).withOpacity(0.5),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
                margin: EdgeInsets.only(top: SizeConfig.screenHeight * .12),
                child: Image.asset('assets/images/logo.png', height: 80, width: 80,)),
          ),
          Align(
            alignment: Alignment.center,
            child: myText(context, "GoMaker", ColorsX.light_orange, SizeConfig.screenHeight*.001, 0, 0, 10, FontWeight.w800, 18.0,),
          ),
          globalWidgets.myTextField(TextInputType.name, nameCtl, false, "Your Name" ),
          SizedBox(height: 10,),
          globalWidgets.myTextField(TextInputType.emailAddress, emailCtl, false, "Email ID" ),
          SizedBox(height: 10,),
          globalWidgets.myTextField(TextInputType.text, passwordCtl, true, "Password" ),
          SizedBox(height: 10,),
          cityDropdown(context),
          SizedBox(height: 10,),
          signUpButton(context),
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: registerNowText(context,20,10,10,0),
          // ),
        ],
      ),
    );
  }
  registerNowText(BuildContext context, double top, double right, double left, double bottom){
    return GestureDetector(
      onTap: (){
        registerAsDialog(context);
        // Get.toNamed(Routes.BASIC_INFORMATION);
      },
      child: Container(
        margin: EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
        child: RichText(
          text: TextSpan(
              children: [
                TextSpan(
                  text: "Don't have an account? ", style: TextStyle(color: ColorsX.white, fontSize: 16),
                ),
                TextSpan(
                  text: "Register Now !", style: TextStyle(color: ColorsX.yellowColor, fontSize: 16, fontWeight: FontWeight.w700),
                )
              ]
          ),
        ),
      ),
    );
  }

  cityDropdown(BuildContext context){
    return Container(
      width: SizeConfig.screenWidth,
      height: 50,
      margin: EdgeInsets.only(top: 5, right: 10, left: 10),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsX.black),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        hint: Text(cityValue),
        underline: SizedBox(),
        value: cityValue,
        //elevation: 5,
        style: TextStyle(
            color: Colors.black,
            fontSize: 14),
        icon: Container(
          margin: EdgeInsets.only(right: 10),
          child: Icon(Icons.arrow_drop_down, color: ColorsX.black,),
        ),
        items: GlobalWidgets.citiesList.map<DropdownMenuItem<String>>(
                (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: EdgeInsets.only(
                      right:
                      SizeConfig.marginVerticalXXsmall),
                  child: globalWidgets.myText(context, value, ColorsX.black, 0, 10, 0, 0, FontWeight.w400, 15),
                ),
              );
            }).toList(),
        onChanged: (value) {
          setState(() {
            cityValue = value!;
            print(cityValue);
          });
        },
      ),
    );
  }
  registerAsDialog(BuildContext context) {

    return AwesomeDialog(
        context: context,
        animType: AnimType.LEFTSLIDE,
        headerAnimationLoop: false,
        dialogType: DialogType.SUCCES,
        dismissOnTouchOutside: false,
        dismissOnBackKeyPress: false,
        closeIcon: Container(),
        // closeIcon: IconButton(icon : Icon(Icons.close, color: ColorsX.light_orange,),onPressed: () {
        //   Get.back();
        //   // Get.toNamed(Routes.LOGIN_SCREEN);
        // },),
        showCloseIcon: true,
        title: 'Register Your Profile',
        desc:
        'How do you want to register?',// \n Save or remember ID to Log In' ,
        btnCancelOnPress: (){},
        btnCancelColor: ColorsX.red_danger,
        btnOkText: 'As Customer',
        btnCancelText: 'As Business',
        buttonsTextStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
        btnOkOnPress: () {
          debugPrint('OnClcik');
          Get.toNamed(Routes.CARD_ONE);
          // deleteProfileNow();
        },
        onDissmissCallback: (type) {
          debugPrint('Dialog Dismiss from callback $type');
        })
      ..show();
  }

  loginAsDialog(BuildContext context) {

    return AwesomeDialog(
        context: context,
        animType: AnimType.LEFTSLIDE,
        headerAnimationLoop: false,
        dialogType: DialogType.SUCCES,
        dismissOnTouchOutside: false,
        dismissOnBackKeyPress: false,
        closeIcon: Container(),
        // closeIcon: IconButton(icon : Icon(Icons.close, color: ColorsX.light_orange,),onPressed: () {
        //   Get.back();
        //   // Get.toNamed(Routes.LOGIN_SCREEN);
        // },),
        showCloseIcon: true,
        title: 'Login Your Profile',
        desc:
        'How do you want to login?',// \n Save or remember ID to Log In' ,
        btnCancelOnPress: (){},
        btnCancelColor: ColorsX.red_danger,
        btnOkText: 'As Customer',
        btnCancelText: 'As Business',
        btnOkOnPress: () {
          debugPrint('OnClcik');
          // deleteProfileNow();
        },
        onDissmissCallback: (type) {
          debugPrint('Dialog Dismiss from callback $type');
        })
      ..show();
  }

  loginButton(BuildContext context,){
    return GestureDetector(
      onTap: (){

        if (emailCtl.text.trim().isEmpty) {
          GlobalWidgets.showErrorToast(
              context, "Email required", 'Please provide your email id');
        }
        else if (passwordCtl.text.trim().isEmpty) {
          GlobalWidgets.showErrorToast(
              context, "Password", 'Please Provide your Password');
        }
        else if(!GlobalWidgets.validateEmail(emailCtl.text)){
          GlobalWidgets.showErrorToast(context, "Email not valid", 'Please provide valid email');
        }
        else{
          // loginNow(emailCtl.text.toString(),passwordCtl.text.toString(), context);
          // checkIfEmailExists(emailCtl.text.toString(),passwordCtl.text.toString(), context);
          loginAsDialog(context);
        }
      },
      child: Container(
        width: SizeConfig.screenWidth,
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: ColorsX.light_orange,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: myText(context, "Login Now", ColorsX.white, 0, 0, 0, 0, FontWeight.w600, 17),
          ),
        ),
      ),
    );
  }
  signUpButton(BuildContext context,){
    return GestureDetector(
      onTap: () async {
        if(nameCtl.text.isEmpty){
          GlobalWidgets.showErrorToast(
              context, "Name Required", 'Provide your Name');
        }
        else if(emailCtl.text.isEmpty){
          GlobalWidgets.showErrorToast(
              context, "Email Required", 'Provide your email');
        }
        else if(passwordCtl.text.isEmpty){
          GlobalWidgets.showErrorToast(
              context, "Password Required", 'Provide your password');
        }
        else if(cityValue == 'Select City'){

          GlobalWidgets.showErrorToast(
              context, "City Required", 'Provide your city');
        }
        else if(!GlobalWidgets.validateEmail(emailCtl.text)){
          GlobalWidgets.showErrorToast(context, "Email not valid", 'Please provide valid email');
        }
        else{
          GlobalWidgets.hideKeyboard(context);
          saveDataOnServer(context);
        }
      },
      child: Container(
        width: SizeConfig.screenWidth,
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: ColorsX.greenish,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: myText(context, "Register Now", ColorsX.white, 0, 0, 0, 0, FontWeight.w600, 17),
          ),
        ),
      ),
    );
  }
  myTextField(TextInputType inputType, TextEditingController ctl, bool obscureText, String hint){
    return Container(
      width: SizeConfig.screenWidth,
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          border: Border.all(color: ColorsX.white, width: 1.25)
      ),
      child: TextFormField(
        keyboardType: inputType,
        controller: ctl,
        obscureText: obscureText,
        decoration: new InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
            EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: hint, hintStyle: TextStyle(color: ColorsX.white)
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
  // Future<void> getData(String email) async {
  //   // Get docs from collection reference
  //
  //   GlobalWidgets.showProgressLoader("Validating Data");
  //
  //
  //   // return documents.length == 1;
  //
  //
  //   CollectionReference _collectionRef =
  //   FirebaseFirestore.instance.collection('candidates');
  //   QuerySnapshot querySnapshot = await _collectionRef.get();
  //
  //   // Get data from docs and convert map to List
  //   final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  //
  //   print(allData);
  //   GlobalWidgets.hideProgressLoader();
  // }


  errorDialog(BuildContext context) {
    return AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: true,
        title: 'Error',
        desc:
        'Please try again. This email already exists.',
        btnOkOnPress: () {},
        btnOkIcon: Icons.cancel,
        btnOkColor: Colors.red)
      ..show();
  }
  Future<String> checkIfEmailExists(String email, Map<String, dynamic> userInfo, BuildContext context) async {
    // Get docs from collection reference
    String response = '';
    GlobalWidgets.showProgressLoader("Validating Data");

    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
    // .limit(1)
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    if(documents.isEmpty) {
      response = 'ok';

      // final res = await _apiService.userSignUp(apiParams: userInfo);
      var collection = FirebaseFirestore.instance.collection('users');
      var docRef = await collection.add(userInfo);
      var documentId = docRef.id;
      GlobalWidgets.hideProgressLoader();
      successDialog(documentId);
      GlobalWidgets.hideProgressLoader();
    }
    else {
      print(documents.first);
      response = 'no';
      GlobalWidgets.hideProgressLoader();
      errorDialog(context);
    }
    return response;
  }
  checkTokenAndUpdate(String? loginToken, String? generatedToken) async {
    if(generatedToken != null || generatedToken !='null'){
      if(generatedToken == loginToken){
        debugPrint('no need to update token');
        Get.toNamed(Routes.ALL_CASTES_MAIN_PAGE);
      }else{

        GlobalWidgets.showProgressLoader("Please wait");
        CollectionReference users =  FirebaseFirestore.instance.collection('candidates');
        await users
            .doc(GlobalVariables.my_ID)
            .update({'token': generatedToken})
            .then((value) => debugPrint('token updated'))
            .catchError((error) => debugPrint('token update error $error'));

        GlobalWidgets.hideProgressLoader();
        Get.toNamed(Routes.ALL_CASTES_MAIN_PAGE);
      }
    }else{
      Get.toNamed(Routes.ALL_CASTES_MAIN_PAGE);
    }
  }

  saveDataOnServer(BuildContext context) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var businessViewed = [];
    GlobalWidgets.showProgressLoader("Saving Data");
    Map<String, dynamic> userInfo = Map();
    userInfo['token'] = prefs.getString('token');
    userInfo['name'] = nameCtl.text;
    userInfo['email'] = emailCtl.text;
    userInfo['password'] = passwordCtl.text;
    userInfo['city'] = cityValue;
    userInfo['business_viewed'] = businessViewed;
    checkIfEmailExists(emailCtl.text, userInfo, context);
  }
  successDialog(String signUpResponse) {
    // String id = '';
    // if(signUpResponse.toString().contains('Data Submitted')){
    //   id = signUpResponse.toString().split(".")[1];
    //   // saveIdInLocal(id);
    // }
    // else{
    //   print('no id found');
    // }
    return AwesomeDialog(
        context: context,
        animType: AnimType.LEFTSLIDE,
        headerAnimationLoop: false,
        dialogType: DialogType.SUCCES,
        dismissOnTouchOutside: false,
        dismissOnBackKeyPress: false,
        closeIcon: Container(),
        // closeIcon: IconButton(icon : Icon(Icons.close, color: ColorsX.light_orange,),onPressed: () {
        //   Get.back();
        //   // Get.toNamed(Routes.LOGIN_SCREEN);
        // },),
        showCloseIcon: true,
        title: '${signUpResponse} \n GooMaker ID',
        desc:
        'Account created successfully',// \n Save or remember ID to Log In' ,
        btnOkOnPress: () {
          debugPrint('OnClcik');
          Get.toNamed(Routes.LOGIN_SCREEN);
          // Get.toNamed(Routes.ALL_CASTES_MAIN_PAGE);
        },
        btnOkIcon: Icons.check_circle,
        onDissmissCallback: (type) {
          debugPrint('Dialog Dismiss from callback $type');
        })
      ..show();
  }
}
