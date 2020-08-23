import 'package:coronatrackingapp/pages/myths.dart';
import 'package:coronatrackingapp/pages/news.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int _selectedIndex=0;

  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    News(),
    Myths(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.feedback),title: Text("News")),
          BottomNavigationBarItem(icon: Icon(Icons.image),title: Text("Myths")),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions[_selectedIndex]
    );
  }
}
