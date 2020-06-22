import 'package:flutter/material.dart';
import 'package:salesapp/UserInterface/login_page.dart';
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
        navigateAfterSeconds: new LoginScreen(),
        image: new Image.asset('images/p_logo.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("Count Impatience"),
        loaderColor: mediumBlue);
  }
}
