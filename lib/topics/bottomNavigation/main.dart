

import 'package:final_practice/topics/bottomNavigation/Screens/home.dart';
import 'package:final_practice/topics/bottomNavigation/Screens/not.dart';
import 'package:final_practice/topics/bottomNavigation/Screens/settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home:MyApp()));
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int selectedindex=0;
  List<Widget> Screens=[HomeScreen(),SettingsScreen(),NotScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My App'),),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        onTap: (int index){
          setState(() {
            selectedindex=index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max_outlined),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification'
          )
        ],
      ),
      body: Screens[selectedindex],
    );
  }
}





