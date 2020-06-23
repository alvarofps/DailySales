import 'package:flutter/material.dart';
import 'package:salesapp/UserInterface/Login/login_page.dart';
import 'sign_up_page_background.dart';
import 'sign_up_page_or_divider.dart';
import 'sign_up_page_social_icon.dart';
import 'package:salesapp/UserInterface/Components/already_have_an_account_acheck.dart';
import 'package:salesapp/UserInterface/Components/rounded_button.dart';
import 'package:salesapp/UserInterface/Components/rounded_input_field.dart';
import 'package:salesapp/UserInterface/Components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}