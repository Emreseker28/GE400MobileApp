import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ge400mobileapp/HomePage.dart';
import 'package:ge400mobileapp/navigator.dart';
import 'package:ge400mobileapp/widgets/button_widget.dart';
import 'package:ge400mobileapp/widgets/textfield_widget.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  TextEditingController mailController = TextEditingController();
  TextEditingController password = TextEditingController();
  Widget build(BuildContext context) {
    String isValid = "";
    //provider get işlemi
    var valid = Provider.of<HomePage>(context).getValid;

    void _changeValidStatus(BuildContext context) {
      Provider.of<HomePage>(context, listen: false).isValidEmail(isValid);
    }

    print(isValid);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 150,
                width: 150,
                child: Image.asset("assets/logo.png"),
              ),
              SizedBox(
                height: 50,
              ),
              TextFieldWidget(
                controller: mailController,
                  hintText: 'Email',
                  obscureText: false,
                  prefixIconData: Icons.mail_outline,
                  suffixIconData: valid ? Icons.check : null,
                  onChanged: (value) {
                    setState(() {
                      isValid = value;
                    });
                    _changeValidStatus(context);
                  }),
              SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                controller: password,
                hintText: 'Password',
                prefixIconData: Icons.lock_outline,
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  print("asdas");
                  print(mailController.text);
                  print(password.text);
                  if (mailController.text == "test@stu.khas.edu.tr" &&
                      password.text != "") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NavigationScreen()),
                    );
                  }
                },
                child: ButtonWidget(
                  title: 'Login',
                  hasBorder: false,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
