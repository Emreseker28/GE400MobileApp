import 'package:flutter/material.dart';
import 'package:ge400mobileapp/HomePage.dart';
import 'package:provider/provider.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final bool? obscureText;
  final Function? onChanged;
  //final ValueChanged<String>? onChanged;

  TextFieldWidget({
   this.hintText,
   this.prefixIconData,
   this.suffixIconData,
   this.obscureText,
   this.onChanged,
});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomePage>(context);
    return TextField(
      onChanged: onChanged!(),
      obscureText: obscureText!,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 14,
      ),
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: Icon(
          prefixIconData,
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
        suffixIcon: GestureDetector(
          onTap: () {
            model.isVisible = !model.isVisible;
          },
          child: Icon(
          suffixIconData,
          size: 18,
          color: Colors.blue,
        ),
        ),
        labelStyle: TextStyle(color: Colors.blue),
        focusColor: Colors.blue,

      ),
    );
  }
}
