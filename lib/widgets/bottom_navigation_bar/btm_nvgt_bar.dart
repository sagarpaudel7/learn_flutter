import 'package:flutter/material.dart';
import 'package:learn_flutter/constants.dart/appbar.dart';

class ButtomNavigationBarDemo extends StatefulWidget {
  const ButtomNavigationBarDemo({super.key});

  @override
  State<ButtomNavigationBarDemo> createState() => _ButtomNavigationBarDemoState();
}

class _ButtomNavigationBarDemoState extends State<ButtomNavigationBarDemo> {
  int _currentPageIndex = 0;
  List<Widget> body = [
    Icon(Icons.home),
    Icon(Icons.menu),
    Icon(Icons.person),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.appBar("Buttom Navigation Bar"),
      body: Center(
        child: body[_currentPageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepOrange,
        currentIndex: _currentPageIndex,
        onTap: ((int newIndex) {
          setState(() {
            _currentPageIndex = newIndex;
          });
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
