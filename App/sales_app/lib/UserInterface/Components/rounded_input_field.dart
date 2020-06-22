import 'package:flutter/material.dart';
import 'package:salesapp/UserInterface/Components/text_field_container.dart';
import 'package:salesapp/UserInterface/constants.dart';
import 'package:salesapp/models/global.dart';
class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: primaryBlue,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: primaryBlue,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}