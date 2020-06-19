import 'package:flutter/material.dart';
import 'package:salesapp/UserInterface/sales_page.dart';
import 'package:salesapp/models/global.dart';
import 'package:splashscreen/splashscreen.dart';



class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 2,
        navigateAfterSeconds: new SalesPage(),
        title: new Text('Welcome In S',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
          ),),
        image: new Image.asset('images/p_logo.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: ()=>print("Count Impatience"),
        loaderColor: mediumBlue
    );
  }
}

