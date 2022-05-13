import 'package:flutter/material.dart';
import 'package:ge400mobileapp/storage.dart';
import 'package:ge400mobileapp/home.dart';
import 'package:ge400mobileapp/login.dart';
import 'fileUpload.dart';




class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}
  int _selectedIndex = 0;
class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
     const List<Widget> _pages = <Widget>[
 HomeScreen(),
       StorageScreen(),
 fileUpload(),

];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
      showUnselectedLabels: true,
      unselectedItemColor: Colors.blue,
      backgroundColor: Colors.white,
      selectedItemColor: Theme.of(context).primaryColor,
      selectedIconTheme: IconThemeData(
        color: Theme.of(context).primaryColor
      ),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper),
          label: 'Announcements',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wb_cloudy_rounded),
          label: 'Storage',

        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.file_upload),
          label: 'Upload',

        ),

      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    ),
     
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
    );
  }
   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

