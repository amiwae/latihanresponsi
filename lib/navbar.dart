import 'package:flutter/material.dart';

import 'halaman_utama.dart';
import 'myprofile.dart';


class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int _selectedIndex = 0;
  final List<Widget> _page = [
    HalamanUtama(),
    MyProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: _page.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(

        child: BottomNavigationBar(
          backgroundColor: Colors.lightBlue,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white60,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
