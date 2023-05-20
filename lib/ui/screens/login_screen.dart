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

class LoginScreen extends StatelessWidget {
  TextEditingController emailCtl = new TextEditingController();
  TextEditingController passwordCtl = new TextEditingController();
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
          Align(
            alignment: Alignment.center,
            child: myText(context, "Already have an account ? Continue to Login", ColorsX.black_with_opacity, SizeConfig.screenHeight*.01, 10, 0, 10, FontWeight.w400, 18.0,),
          ),
          globalWidgets.myTextField(TextInputType.emailAddress, emailCtl, false, "Email ID" ),
          SizedBox(height: 15,),
          globalWidgets.myTextField(TextInputType.text, passwordCtl, true, "Password" ),
          SizedBox(height: 15,),
          // Align(
          //   alignment: Alignment.centerRight,
          //   child: myText(context, "Forgot Password?", ColorsX.black_with_opacity, 0, 0, 10, 10, FontWeight.w400, 16,),
          // ),
          loginButton(context),
          Align(
            alignment: Alignment.center,
            child: myText(context, "Don't have an account ? Click to Register", ColorsX.black_with_opacity, 15, 10, 0, 15, FontWeight.w400, 18.0,),
          ),
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
        buttonsTextStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
        btnCancelText: 'As Business',
        btnOkOnPress: () {
          debugPrint('OnClcik');
          Get.toNamed(Routes.REGISTER_CUSTOMER_SCREEN);
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
        btnCancelOnPress: (){
          loginNow('Business', emailCtl.text, passwordCtl.text, context);
        },
        btnCancelColor: ColorsX.red_danger,
        btnOkText: 'As Customer',
        buttonsTextStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
        btnCancelText: 'As Business',
        btnOkOnPress: () {
          debugPrint('OnClcik');
          loginNow('Customer', emailCtl.text, passwordCtl.text, context);
          // deleteProfileNow();
        },
        onDissmissCallback: (type) {
          debugPrint('Dialog Dismiss from callback $type');
        })
      ..show();
  }
  Future<String> loginNow(String loginAs ,String email, String password, BuildContext context) async {
    if(loginAs == 'Customer') {
      // Get docs from collection reference
      String response = '';
      GlobalWidgets.hideKeyboard(context);
      GlobalWidgets.showProgressLoader("Validating Data");

      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .limit(1)
          .get();

      final List<DocumentSnapshot> documents = querySnapshot.docs;
      GlobalWidgets.hideProgressLoader();
      if (documents.isEmpty) {
        errorDialog(context);
      }
      else {
        print(documents.first);

        String id = querySnapshot.docs[0].reference.id;
        //parsing of data to save in shared preferences
        for (var doc in querySnapshot.docs) {
          // Getting data directly

          String name = doc.get('name');
          String city = doc.get('city');
          String email = doc.get('email');
          String password = doc.get('password');
          String token = doc.get('token');
          saveDataInLocal(id, name, city, email, password, token);
          debugPrint(id);
          // Getting data from map
          // Map<String, dynamic> data = doc.data();
          // int age = data['age'];
        }
      }
      return response;
    }
    else{
      // Get docs from collection reference
      String response = '';
      GlobalWidgets.hideKeyboard(context);
      GlobalWidgets.showProgressLoader("Validating Data");

      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('business')
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .limit(1)
          .get();

      final List<DocumentSnapshot> documents = querySnapshot.docs;
      GlobalWidgets.hideProgressLoader();
      if (documents.isEmpty) {
        errorDialog(context);
      }
      else {
        print(documents.first);

        String id = querySnapshot.docs[0].reference.id;
        //parsing of data to save in shared preferences
        for (var doc in querySnapshot.docs) {
          // Getting data directly

          String name = doc.get('name');
          String ownerName = doc.get('owner_name');
          String city = doc.get('city');
          String email = doc.get('email');
          String address = doc.get('address');
          String token = doc.get('token');
          String shortDescription = doc.get('short_description');
          String profession = doc.get('profession');
          String contact_number = doc.get('contact_number');
          saveBusinessDataInLocal(id,ownerName, name, city, email, address, shortDescription, profession,contact_number,token);
          debugPrint(id);
          // Getting data from map
          // Map<String, dynamic> data = doc.data();
          // int age = data['age'];
        }
      }
      return response;
    }
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
          GlobalWidgets.hideKeyboard(context);
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
      onTap: (){
        // Get.toNamed(Routes.BASIC_INFORMATION);
        registerAsDialog(context);
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

  // Future<String> checkIfEmailExists(String email, String password, BuildContext context) async {
  //   // Get docs from collection reference
  //   String response = '';
  //   GlobalWidgets.hideKeyboard(context);
  //   GlobalWidgets.showProgressLoader("Validating Data");
  //
  //   final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //       .collection('candidates')
  //       .where('email', isEqualTo: email)
  //       .where('password', isEqualTo: password)
  //       .limit(1)
  //       .get();
  //
  //   final List<DocumentSnapshot> documents = querySnapshot.docs;
  //   GlobalWidgets.hideProgressLoader();
  //   if(documents.isEmpty) {
  //     errorDialog(context);
  //   }
  //   else {
  //     print(documents.first);
  //
  //     String id = querySnapshot.docs[0].reference.id;
  //     //parsing of data to save in shared preferences
  //     for (var doc in querySnapshot.docs) {
  //       // Getting data directly
  //
  //       String religion = doc.get('religion');
  //       String caste = doc.get('caste');
  //       String subcaste = doc.get('subcaste');
  //       String sect = doc.get('sect');
  //       String account_created_at = doc.get('account_created_at');
  //       String mother_tongue = doc.get('mother_tongue');
  //       String phone = doc.get('primary_phone');
  //       String gender = doc.get('gender');
  //       String token = "${doc.get('token')}";
  //       saveDataInLocal(id,,token);
  //       debugPrint(id);
  //       // Getting data from map
  //       // Map<String, dynamic> data = doc.data();
  //       // int age = data['age'];
  //     }
  //   }
  //
  //   return response;
  // }
//   loginNow(String email, String password, BuildContext context) async{
//
//     var _apiService = ApiService();
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     GlobalVariables.email = email;
//     GlobalVariables.password = password;
//
//     Map<String, dynamic> userInfo = Map();
//
//     userInfo['email'] = GlobalVariables.email;
//     userInfo['password'] = GlobalVariables.password;
//
//     GlobalWidgets.showProgressLoader("Please Wait");
//     GlobalWidgets.hideKeyboard(context);
//     final res = await _apiService.userLogin(apiParams: userInfo);
//     GlobalWidgets.hideProgressLoader();
//     if (res is LoginModel) {
//       prefs.setString('id', "${res.serverResponse.basicDetails.id}");
//       prefs.setString('caste', "${res.serverResponse.basicDetails.caste}");
//       prefs.setString('subcaste', "${res.serverResponse.basicDetails.subcaste}");
//       prefs.setString('religion', "${res.serverResponse.basicDetails.religion}");
//       prefs.setString('sect', "${res.serverResponse.basicDetails.sect}");
//       prefs.setString('account_created_at', "${res.serverResponse.others.accountCreatedAt}");
//       prefs.setString('mother_tongue', "${res.serverResponse.basicDetails.motherTongue}");
//       prefs.setString('phone', "${res.serverResponse.basicDetails.primaryPhone}");
//       prefs.setString('gender', "${res.serverResponse.basicDetails.gender}");
//
//       print(prefs.getString('id'));
//       print(prefs.getString('caste'));
//       print(prefs.getString('subcaste'));
//       print(prefs.getString('religion'));
//       print(prefs.getString('sect'));
//       print(prefs.getString('account_created_at'));
//       print(prefs.getString('mother_tongue'));
//       print(prefs.getString('gender'));
//       Get.toNamed(Routes.ALL_CASTES_MAIN_PAGE);
// //show success dialog
// //        successDialog(GlobalVariables.signUpResponse);
//     }
//     else {
//       errorDialog(context);
//     }
//   }

  errorDialog(BuildContext context) {
    return AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: true,
        title: 'Invalid Credentials',
        desc:
        'Please try again with valid email and password',
        btnOkOnPress: () {},
        btnOkIcon: Icons.cancel,
        btnOkColor: Colors.red)
      ..show();
  }

 saveDataInLocal(String id, String name, String city, String email,
      String password, String token) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('id', "${id}");
    prefs.setString('name', "${name}");
    prefs.setString('city', "${city}");
    prefs.setString('email', "${emailCtl}");
    prefs.setString('password', "${password}");
    prefs.setString('token_from_login', "${token}");

    print(prefs.getString('id'));
    print(prefs.getString('name'));
    print(prefs.getString('city'));
    print(prefs.getString('email'));
    print(prefs.getString('password'));
    print(prefs.getString('token_from_login'));
    print(prefs.getString('token'));
    GlobalVariables.my_ID = id;
    checkTokenAndUpdate("Customer" ,prefs.getString('token_from_login'),prefs.getString('token'));
  }

  checkTokenAndUpdate(String updateAs ,String? loginToken, String? generatedToken) async {
    if(updateAs == 'Customer') {
      if (generatedToken != null || generatedToken != 'null') {
        if (generatedToken == loginToken) {
          debugPrint('no need to update token');
          Get.toNamed(Routes.CARD_ONE);
        } else {
          GlobalWidgets.showProgressLoader("Please wait");
          CollectionReference users = FirebaseFirestore.instance.collection(
              'users');
          await users
              .doc(GlobalVariables.my_ID)
              .update({'token': generatedToken})
              .then((value) => debugPrint('token updated'))
              .catchError((error) => debugPrint('token update error $error'));

          GlobalWidgets.hideProgressLoader();
          Get.toNamed(Routes.CARD_ONE);
        }
      } else {
        Get.toNamed(Routes.CARD_ONE);
      }
    }
    else if(updateAs == 'Business'){
      if (generatedToken != null || generatedToken != 'null') {
        if (generatedToken == loginToken) {
          debugPrint('no need to update token');
          Get.toNamed(Routes.BUSINESS_MAIN_PAGE);
        } else {
          GlobalWidgets.showProgressLoader("Please wait");
          CollectionReference users = FirebaseFirestore.instance.collection(
              'business');
          await users
              .doc(GlobalVariables.my_ID)
              .update({'token': generatedToken})
              .then((value) => debugPrint('token updated'))
              .catchError((error) => debugPrint('token update error $error'));

          GlobalWidgets.hideProgressLoader();
          Get.toNamed(Routes.BUSINESS_MAIN_PAGE);
        }
      } else {
        Get.toNamed(Routes.BUSINESS_MAIN_PAGE);
      }

    }
  }

   saveBusinessDataInLocal(String id, String ownerName, String name, String city, String email,
       String address, String shortDescription, String profession, String contact_number,String token) async {


     SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString('id', "${id}");
     prefs.setString('owner_name', "${ownerName}");
     prefs.setString('name', "${name}");
     prefs.setString('city', "${city}");
     prefs.setString('email', "${email}");
     prefs.setString('contact_number', "${contact_number}");
     prefs.setString('address', "${address}");
     prefs.setString('short_description', "${shortDescription}");
     prefs.setString('profession', "${profession}");
     prefs.setString('token_from_login', "${token}");

     print(prefs.getString('id'));
     print(prefs.getString('name'));
     print(prefs.getString('owner_name'));
     print(prefs.getString('city'));
     print(prefs.getString('email'));
     print(prefs.getString('address'));
     print(prefs.getString('short_description'));
     print(prefs.getString('profession'));
     print(prefs.getString('token_from_login'));
     print(prefs.getString('token'));
     GlobalVariables.BUSINESS_ID = id;
     checkTokenAndUpdate('Business',prefs.getString('token_from_login'),prefs.getString('token'));
   }

}
