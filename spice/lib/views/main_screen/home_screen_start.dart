

import 'package:flutter/material.dart';
import 'package:spice/views/main_screen/cart_tab_screen.dart';
import 'package:spice/views/main_screen/home_tab_screen.dart';
import 'package:spice/views/main_screen/menu_tab_screen.dart';
import 'package:spice/views/main_screen/notification_tab.dart';
import 'package:spice/views/widget/constant.dart';

class HomeScreenStart extends StatefulWidget {
  @override
  _HomeScreenStartState createState() => _HomeScreenStartState();
}

class _HomeScreenStartState extends State<HomeScreenStart> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeTab(),
    MenuTab(),
    NotificationTab(),
    CartTabScreen()
  ];

  final AppColor constant = AppColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], 
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, 
        currentIndex: _currentIndex, 
        onTap: (index) {
          setState(() {
            _currentIndex = index; 
          });
        },
        backgroundColor: constant.primaryColor,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            icon: ImageIcon(AssetImage("assets/imgs/menu.png")),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            icon: Icon(Icons.message_outlined),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            icon: ImageIcon(AssetImage("assets/imgs/cart.png")),
            label: 'Cart',
          ),
        ],
        selectedItemColor: constant.secondaryColor,
        unselectedItemColor: constant.secondaryColor,
      ),
    );
  }
}




class CartTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Cart Screen',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
