import 'package:flutter/material.dart';
import 'package:sneve/components/card_component.dart';
import 'package:sneve/components/main_navigation_bar.dart';
import 'package:sneve/components/wow_button.dart';
import 'package:sneve/pages/events_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          primaryColor: Colors.white,
          bottomAppBarColor: Colors.grey,
          backgroundColor: Colors.white,
          unselectedWidgetColor: Colors.grey,
          brightness: Brightness.light,
          dividerColor: Colors.black12,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              elevation: 0.0,
              backgroundColor: Colors.white,
              titleTextStyle: TextStyle(color: Colors.deepOrange, fontSize: 25, fontWeight: FontWeight.bold)
          ),
          textTheme: const TextTheme(button: TextStyle(fontSize: 20))),
      darkTheme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: Colors.black,
        bottomAppBarColor: Colors.grey,
        backgroundColor: Colors.black,
        unselectedWidgetColor: Colors.grey,
        brightness: Brightness.dark,
        dividerColor: Colors.black12,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,titleTextStyle: TextStyle(color: Colors.deepOrange, fontSize: 25, fontWeight: FontWeight.bold)
        )
      ),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text("Home"),
    Text("Social"),
    EventsView(),
    Text("Profile"),
  ];

  int getSelectedIndex() {
    return _selectedIndex;
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("My Eventlist")),
        body: Center(
          child: _widgetOptions[_selectedIndex],
          ),
        bottomNavigationBar: MainNavigationBar(homePageState: this),
        );
  }
}
