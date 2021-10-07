import 'package:flutter/material.dart';
import 'package:mypets/admin/addproduct.dart';
import 'package:mypets/admin/homepage.dart';
import 'package:mypets/admin/orders.dart';
import 'package:mypets/admin/profile.dart';
import 'package:mypets/admin/userlist.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    OrdersReceived(),
    AddProduct(),
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
          //selectedLabelStyle: TextStyle(color: Colors.white),
          unselectedLabelStyle: TextStyle(color: Colors.black),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 0.0,
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          unselectedItemColor: Colors.black,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            // BottomNavigationBarItem(
            //   backgroundColor: Colors.transparent,
            //   icon: Icon(
            //     Icons.supervised_user_circle_outlined,
            //   ),
            //   label: 'Users',
            // ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(
                Icons.add,
              ),
              label: 'Add Products',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(
                Icons.settings,
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
