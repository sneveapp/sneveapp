import 'package:flutter/material.dart';
import 'package:sneve/sneve_app.dart';

class MainNavigationBar extends StatefulWidget {
  final MainViewState mainViewState;

  const MainNavigationBar({Key? key, required this.mainViewState})
      : super(key: key);

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
        BottomNavigationBarItem(
            icon: Icon(Icons.library_books), label: "Eventlist Library"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
      currentIndex: widget.mainViewState.getSelectedIndex(),
      onTap: widget.mainViewState.onItemTapped,
      selectedItemColor:
          MediaQuery.platformBrightnessOf(context) == Brightness.light
              ? Colors.black
              : Colors.white,
      unselectedItemColor: Colors.grey,
    );
  }
}
