import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ge400mobileapp/widgets/textfield_widget.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TextFieldWidget(
          hintText:'Email',
          obscureText: false,
          prefixIconData: Icons.mail_outline,
        ),
        TextFieldWidget(
          hintText:'Password',
          obscureText: false,
          prefixIconData: Icons.lock_outline,
        ),
      ],
    );
}