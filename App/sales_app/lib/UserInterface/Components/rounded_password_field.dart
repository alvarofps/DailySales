import 'package:flutter/material.dart';
import 'package:salesapp/UserInterface/Components/text_field_container.dart';
import 'package:salesapp/UserInterface//constants.dart';
import 'package:salesapp/models/global.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: primaryBlue,
        decoration: InputDecoration(
          hintText: "Clave",
          icon: Icon(
            Icons.lock,
            color: primaryBlue,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: primaryBlue,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}