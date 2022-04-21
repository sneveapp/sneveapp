import 'package:flutter/material.dart';
import 'package:sneve/components/sneve_appbar.dart';
import 'package:sneve/components/main_navigation_bar.dart';
import 'package:sneve/config/theme_config.dart';
import 'package:sneve/pages/events_view.dart';
import 'package:sneve/pages/home_view.dart';
import 'package:sneve/pages/profile_view.dart';
import 'package:sneve/pages/social_view.dart';
import 'package:sneve/sneve_theme.dart';

class SneveApp extends StatelessWidget {
  const SneveApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sneve',
      theme: ThemeConfig.lightTheme.toThemeData(),
      darkTheme: ThemeConfig.darkTheme.toThemeData(),
      themeMode: ThemeMode.system,
      home: const MainView(title: 'Sneve'),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MainView> createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    SocialView(),
    EventsView(),
    ProfileView(),
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
      appBar: SneveAppBar(mainViewState: this),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: MainNavigationBar(mainViewState: this),
    );
  }
}
