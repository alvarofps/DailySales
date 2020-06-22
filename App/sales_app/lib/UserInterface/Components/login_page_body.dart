import 'package:flutter/material.dart';
import 'package:salesapp/UserInterface/Components/login_page_background.dart';
import 'package:salesapp/UserInterface/sales_page.dart';
import 'package:salesapp/UserInterface/sign_up_page.dart';
import 'package:salesapp/UserInterface/Components/already_have_an_account_acheck.dart';
import 'package:salesapp/UserInterface/Components/rounded_button.dart';
import 'package:salesapp/UserInterface/Components/rounded_input_field.dart';
import 'package:salesapp/UserInterface/Components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salesapp/models/global.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "INGRESAR",
              style: homeBlueFont,
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "icons/signup.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Nombre de usuario",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "INGRESAR",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SalesPage();
                    },
                  ),
                );

              },
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
