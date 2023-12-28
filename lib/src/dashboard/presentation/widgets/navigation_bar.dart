import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../views/dashboard_screen.dart';
import 'nav_bar_icons.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    Text('Recruit',
        style: TextStyle(
            fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.bold)),
    Text('Social',
        style: TextStyle(
            fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.bold)),
    Text('Message',
        style: TextStyle(
            fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.bold)),
    Text('Profile',
        style: TextStyle(
            fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.bold)),
  ];

  Future<void> _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            navBarIcon('work', 'Work'),
            navBarIcon('recruit', 'Recruit'),
            navBarIcon('social', 'Social'),
            navBarIcon('messages', 'Message'),
            navBarIcon('profile', 'Profile'),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: primaryBlue,
          unselectedItemColor: grey,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
