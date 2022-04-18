import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneve/main.dart';

class MainNavigationBar extends StatefulWidget {
  final MyHomePageState homePageState;
  
  const MainNavigationBar({Key? key, required this.homePageState}) : super(key: key);

  @override
  State<MainNavigationBar> createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Social"),
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: "Eventlist Library"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: widget.homePageState.getSelectedIndex(),
        onTap: widget.homePageState.onItemTapped,
        selectedItemColor: MediaQuery.platformBrightnessOf(context) == Brightness.light ? Colors.black : Colors.white,
        unselectedItemColor: Colors.grey,
    );
  }
}
