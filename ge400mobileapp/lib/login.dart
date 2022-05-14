import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ge400mobileapp/HomePage.dart';
import 'package:ge400mobileapp/navigator.dart';
import 'package:ge400mobileapp/widgets/button_widget.dart';
import 'package:ge400mobileapp/widgets/textfield_widget.dart';
import 'package:provider/provider.dart';

import 'globals.dart';
import 'home.dart';
import 'main.dart';
import 'package:email_validator/email_validator.dart';

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}



class _LoginState extends State<Login> {
  //static final _formKey =  GlobalKey<FormState>();
  GlobalKey<FormState> _productKey = GlobalKey<FormState>();
  TextEditingController mailController = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
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
          child: Form(
            key:_productKey,
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
                    validation: (value) {
                      bool isValidEmail = EmailValidator.validate(value);
                      if (value.isEmpty) {
                        return "Please enter a e-mail!";
                      } else if (!isValidEmail) {
                        return "Please enter a valid mail!";
                      }

                      return null;
                    },
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
                  validation: (value) {
                    if (value.isEmpty) {
                      return "Please enter a password!";
                    } else if (password.text.length < 6) {
                      return "Password must be longer than 6!";
                    }

                    return null;
                  },
                  controller: password,
                  hintText: 'Password',
                  prefixIconData: Icons.lock_outline,
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    //print("asdas");
                    //print(mailController.text);
                    //print(password.text);
                    if (_productKey.currentState!.validate()) {
                      signIn();
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
      ),
    );
  }

  Future signIn() async {
    //showDialog(
    //     context: context,
    //    barrierDismissible: false,
    //    builder: (context) => Center(child: CircularProgressIndicator()),
    //);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mailController.text.trim(),
        password: password.text.trim(),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NavigationScreen()),
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == "user-not-found") {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                  backgroundColor: Colors.white54,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0)), //this right here
                  child: Container(
                    height: 150,
                    width: 300,
                    color: Colors.white10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Icon(
                            Icons.warning_amber_outlined,
                            color: Colors.blue,
                            size: 40,
                          )),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              "Incorrect e-mail or password!",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Center(
                              child: TextButton(
                                  child: Text("Back",
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 20)),
                                  onPressed: Navigator.of(context).pop))
                        ],
                      ),
                    ),
                  ));
            });
      } if (e.code == "wrong-password") {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                  backgroundColor: Colors.white54,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(20.0)), //this right here
                  child: Container(
                    height: 150,
                    width: 300,
                    color: Colors.white10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Icon(
                                Icons.warning_amber_outlined,
                                color: Colors.blue,
                                size: 40,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              "Incorrect e-mail or password!",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Center(
                              child: TextButton(
                                  child: Text("Back",
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 20)),
                                  onPressed: Navigator.of(context).pop))
                        ],
                      ),
                    ),
                  ));
            });
      }
      //navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }
  }
}
