import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../global/colors.dart';
import '../../../global/global_widgets.dart';
import '../../../global/size_config.dart';
import '../../../widget/drawer_widget.dart';

class BusinessMainPage extends StatefulWidget {
  const BusinessMainPage({Key? key}) : super(key: key);

  @override
  _BusinessMainPageState createState() => _BusinessMainPageState();
}

class _BusinessMainPageState extends State<BusinessMainPage> {
  GlobalWidgets globalWidgets = GlobalWidgets();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: body(context),
        drawer: DrawerWidget(context),
        appBar: AppBar(
          backgroundColor: ColorsX.black,
          centerTitle: true,
          title: globalWidgets.myText(context, "Profile", ColorsX.white, 0, 0,0,0, FontWeight.w400, 16),
          leading: IconButton(
            icon: Icon(Icons.menu_rounded, color: ColorsX.white,),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(), //Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
    );
  }
  body(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: Stack(
        children: <Widget>[
          Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
              // color:  const Color(0xff70b4ff).withOpacity(0.8),
              color: Color(0xfff0f0f0),
            ),
            child: Center(
              child:
              globalWidgets.myText(context, 'You have no saved cards yet', ColorsX.black, 0, 0, 0, 0,
                  FontWeight.w700, 16),
            ),
          ),
          // listViewContent(context),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     child: BottomBar(),
          //   ),
          // )
        ],
      ),
    );
  }
}
