import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ge400mobileapp/HomePage.dart';
import 'package:ge400mobileapp/widgets/button_widget.dart';
import 'package:ge400mobileapp/widgets/textfield_widget.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context){

    final model = Provider.of<HomePage>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
        TextFieldWidget(
        hintText: 'Email',
        obscureText: false,
        prefixIconData: Icons.mail_outline,
        suffixIconData: model.isValid ? Icons.check : null,
            onChanged: (value) {
              model.isValidEmail(value);
            }
      ),
        SizedBox(
          height: 10,
        ),
        TextFieldWidget(
        hintText: 'Password',
        obscureText: model.isVisible ? false : true,
        prefixIconData: Icons.lock_outline,
        suffixIconData:
        model.isVisible ? Icons.visibility : Icons.visibility_off,
      ),
              SizedBox(
                height: 20,
              ),
              ButtonWidget(
                title: 'Login',
                hasBorder: false,
              ),
              SizedBox(
                height: 10,
              ),
      ],
    ),
    ),
    );
  }
}