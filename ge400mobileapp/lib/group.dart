import 'package:flutter/material.dart';
class GroupScreen extends StatelessWidget {
  const GroupScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Khas Student Portal"),
      ),
      body: Container(),
    );
  }
}