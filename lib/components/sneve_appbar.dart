import 'package:flutter/material.dart';
import 'package:sneve/config/theme_config.dart';
import 'package:sneve/sneve_theme.dart';
import '../sneve_app.dart';

class SneveAppBar extends StatefulWidget implements PreferredSizeWidget {
  final MainViewState mainViewState;
  const SneveAppBar({Key? key, required this.mainViewState}) : super(key: key);

  @override
  State<SneveAppBar> createState() => _SneveAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(ThemeConfig.appBarStyle.height);
}

class _SneveAppBarState extends State<SneveAppBar> {
  String getText() {
    switch (widget.mainViewState.getSelectedIndex()) {
      case 0:
        return "Sneve";
      case 1:
        return "Social";
      case 2:
        return "My Eventlists";
      case 3:
        return "Profile";
      default:
        return "Svelte";
    }
  }

  Widget getMenu() {
    switch (widget.mainViewState.getSelectedIndex()) {
      case 0:
        return Row();
      case 1:
        return Row(
          children: [
            IconButton(
                onPressed: () => print("social menu button pressed"),
                icon: Icon(Icons.message))
          ],
        );
      case 2:
        return Row();
      case 3:
        return Row();
      default:
        return Row();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            margin: EdgeInsets.only(
                top: ThemeConfig.appBarStyle.titleSize, bottom: 0),
            width: MediaQuery.of(context).size.width *
                ThemeConfig.appBarStyle.widthPercent,
            padding: const EdgeInsets.only(bottom: 0),
            decoration: BoxDecoration(),
            child: Row(
              children: [
                Text(getText(),
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: ThemeConfig.appBarStyle.titleColor,
                        fontSize: ThemeConfig.appBarStyle.titleSize)),
                Spacer(),
                getMenu()
              ],
            )));
  }
}
