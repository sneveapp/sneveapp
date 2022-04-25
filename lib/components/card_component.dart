import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sneve/components/card_button.dart';
import 'package:sneve/components/wow_button.dart';
import 'package:sneve/config/theme_config.dart';

enum CardType { memory, event }

class CardComponent extends StatelessWidget {
  final CardType type;
  final String name;
  final String? imageUrl;

  const CardComponent(
      {Key? key, required this.type, required this.name, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width *
                ThemeConfig.cardComponentStyle.widthPercent <=
            ThemeConfig.cardComponentStyle.maxWidth
        ? MediaQuery.of(context).size.width *
            ThemeConfig.cardComponentStyle.widthPercent
        : ThemeConfig.cardComponentStyle.maxWidth;
    final double _height = MediaQuery.of(context).size.height *
        ThemeConfig.cardComponentStyle.heightPercent;
    final double _badgeSize = ThemeConfig.cardComponentStyle.badgeSize;
    final Color _badgeColor = ThemeConfig.cardComponentStyle.badgeColor;

    return GestureDetector(
        child: Stack(
          children: [
            Container(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(
                    ThemeConfig.cardComponentStyle.borderRadius)),
                boxShadow: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ]
                    : null,
              ),
            ),
            imageUrl != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(
                        ThemeConfig.cardComponentStyle.borderRadius),
                    child: Image.network(
                      imageUrl!,
                      fit: BoxFit.fitWidth,
                      width: _width,
                      height: _height,
                    ))
                : Container(),
            Container(
                width: _width,
                height: _height,
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: _width,
                  height: _height / 1.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                              ThemeConfig.cardComponentStyle.borderRadius),
                          bottomRight: Radius.circular(
                              ThemeConfig.cardComponentStyle.borderRadius)),
                      gradient: LinearGradient(
                          begin: const Alignment(0, 0),
                          end: const Alignment(0, -1),
                          colors: [
                            Color(getColor()).withOpacity(0.70),
                            Color(getColor()).withOpacity(0.0)
                          ])),
                )),
            getBadge(_width, _height, _badgeSize, _badgeColor),
            Container(
                width: _width,
                height: _height,
                padding: EdgeInsets.only(
                    left: ThemeConfig.cardComponentStyle.padding,
                    bottom: ThemeConfig.cardComponentStyle.padding,
                    right: ThemeConfig.cardComponentStyle.wowButtonMargin,
                    top: ThemeConfig.cardComponentStyle.wowButtonMargin),
                margin: EdgeInsets.only(
                    bottom: ThemeConfig.cardComponentStyle.bottomMargin),
                decoration: BoxDecoration(
                  border: MediaQuery.of(context).platformBrightness ==
                          Brightness.dark
                      ? Border.all(color: Colors.grey, width: 0.5)
                      : null,
                  borderRadius: BorderRadius.all(Radius.circular(
                      ThemeConfig.cardComponentStyle.borderRadius)),
                ),
                alignment: Alignment.bottomCenter,
                child: Column(children: [
                  Row(
                    children: [const Spacer(), getWowButton()],
                  ),
                  const Spacer(),
                  Row(
                    children: [CardButton(type: type), const Spacer()],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: _width * 0.9,
                        child: Text(
                          name,
                          style: TextStyle(
                              fontSize:
                                  ThemeConfig.cardComponentStyle.titleSize *
                                      MediaQuery.of(context).size.width /
                                      250,
                              fontWeight: FontWeight.bold,
                              color: Color(getTextColor())),
                        ),
                      ),
                      const Spacer(),
                    ],
                  )
                ])),
          ],
        ),
        onTap: getReaction());
  }

  int getColor() {
    switch (type) {
      case CardType.memory:
        return 0xff000000;
      case CardType.event:
        return 0xff000000;
      default:
        return 0;
    }
  }

  int getTextColor() {
    switch (type) {
      case CardType.memory:
        return 0xffffffff;
      case CardType.event:
        return 0xffffffff;
      default:
        return 0;
    }
  }

  String getButtonText() {
    switch (type) {
      case CardType.memory:
        return "relive";
      case CardType.event:
        return "experience";
      default:
        return "";
    }
  }

  Widget getWowButton() {
    switch (type) {
      case CardType.memory:
        return const WowButton(isWow: false);
      case CardType.event:
        return const Text("");
      default:
        return const Text("");
    }
  }

  VoidCallback getReaction() {
    switch (type) {
      case CardType.memory:
        return () {
          if (kDebugMode) {
            print("This is a memory");
          }
        };
      case CardType.event:
        return () {
          if (kDebugMode) {
            print("This is an event");
          }
        };
      default:
        return () {
          if (kDebugMode) {
            print("");
          }
        };
    }
  }

  Widget getBadge(
      double _width, double _height, double _badgeSize, Color _badgeColor) {
    switch (type) {
      case CardType.memory:
        return ClipRRect(
            borderRadius: BorderRadius.all(
                Radius.circular(ThemeConfig.cardComponentStyle.borderRadius)),
            child: SizedBox(
              width: _width,
              height: _height,
              child: SizedBox(
                height: _badgeSize,
                child: Row(
                  children: [
                    SizedBox(
                      width: _width - _badgeSize,
                    ),
                    Column(
                      children: [
                        Container(
                          width: _badgeSize,
                          height: _badgeSize,
                          decoration: BoxDecoration(
                              color: _badgeColor,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(999))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
      case CardType.event:
        return const Text("");
      default:
        return const Text("");
    }
  }
}
