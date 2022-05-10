import 'package:flutter/material.dart';
import 'package:ge400mobileapp/HomePage.dart';
import 'package:provider/provider.dart';

class TextFieldWidget extends StatefulWidget {
  final String? hintText;
  final IconData? prefixIconData;
  final suffixIconData;
  final obscureText;
  final onChanged;
  final controller;
  //final ValueChanged<String>? onChanged;

  TextFieldWidget({
    this.hintText,
    this.prefixIconData,
    this.suffixIconData,
    this.obscureText,
    this.onChanged, this.controller,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

bool isVisible = true;

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    void _changeVisibleStatus(BuildContext context) {
      Provider.of<HomePage>(context, listen: false).isVisible(isVisible);
    }

    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: widget.hintText != "Password"
          ? false
          : isVisible == true
              ? true
              : false,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 14,
      ),
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        labelText: widget.hintText,
        prefixIcon: Icon(
          widget.prefixIconData,
          size: 18,
          color: Colors.blue,
        ),
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue),
        ),
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              isVisible = !isVisible;
            });
            print(isVisible);
            _changeVisibleStatus(context);
          },
          child: widget.hintText != "Password"
              ? Icon(
                  widget.suffixIconData,
                  size: 18,
                  color: Colors.blue,
                )
              : isVisible == false
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off),
        ),
        labelStyle: TextStyle(color: Colors.blue),
        focusColor: Colors.blue,
      ),
    );
  }
}
