import 'package:flutter/material.dart';
import 'package:mypets/user/bottombar/homepage.dart';
import 'package:mypets/user/bottombar/profile.dart';
import 'package:mypets/user/bottombar/orders.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    OrdersList(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: Center(
        child: Container(child: _widgetOptions.elementAt(_selectedIndex)),
      ),
      bottomNavigationBar: Container(
        color: Colors.black87,
        child: BottomNavigationBar(
          unselectedFontSize: 12,
          showSelectedLabels: true,
          selectedFontSize: 16,
          selectedItemColor: Colors.white38,
          unselectedLabelStyle: TextStyle(color: Colors.black),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 0.0,
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          unselectedItemColor: Colors.black,
          items:<BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(Icons.home,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(Icons.shopping_cart_outlined,),
              label: 'Orders',
            ),
            BottomNavigationBarItem(              backgroundColor: Colors.transparent,

              icon: Icon(Icons.person,),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
