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
  
   Icon(
    Icons.chat,
    size: 150,
  ),
];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
      showUnselectedLabels: true,
      unselectedItemColor: Colors.blue,
      backgroundColor: Colors.grey,
      selectedItemColor: Theme.of(context).primaryColor,
      selectedIconTheme: IconThemeData(
        color: Theme.of(context).primaryColor
      ),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
         
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wb_cloudy_rounded),
          label: 'Storage',
         
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.file_upload),
          label: 'Upload',
         
        ),
         BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
               Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Login()),
  );
            },
            child: Icon(Icons.exit_to_app)),
          label: 'Exit',
         //onPressed: () => FirebaseAuth.instance.signOut(),
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

