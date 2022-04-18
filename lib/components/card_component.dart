import 'package:flutter/material.dart';
import 'package:sneve/components/card_button.dart';
import 'package:sneve/components/wow_button.dart';

enum CardType { memory, event }

class CardComponent extends StatelessWidget {
  final double _radius = 12;

  final CardType type;
  final String name;
  final String? imageUrl;

  const CardComponent(
      {Key? key, required this.type, required this.name, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width * 0.9;
    final double _height = MediaQuery.of(context).size.height * 0.3;
    const double _badgeSize = 75;
    const int _badgeColor = 0xff000000;

    return GestureDetector(
        child: Stack(
          children: [
            Container(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(_radius)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
            imageUrl != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(_radius),
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
                          bottomLeft: Radius.circular(_radius),
                          bottomRight: Radius.circular(_radius)),
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
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(_radius)),
                ),
                alignment: Alignment.bottomCenter,
                child: Column(children: [
                  Row(
                    children: [Spacer(), getWowButton()],
                  ),
                  Spacer(),
                  Row(
                    children: [CardButton(type: type), Spacer()],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          name,
                          style: TextStyle(
                              fontSize:
                                  16 * MediaQuery.of(context).size.width / 250,
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
          print("This is a memory");
        };
      case CardType.event:
        return () {
          print("This is an event");
        };
      default:
        return () {
          print("");
        };
    }
  }

  Widget getBadge(
      double _width, double _height, double _badgeSize, int _badgeColor) {
    switch (type) {
      case CardType.memory:
        return ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(_radius)),
            child: Container(
              width: _width,
              height: _height,
              child: Container(
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
                              color: Color(_badgeColor),
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(100))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
      case CardType.event:
        return Text("");
      default:
        return Text("");
    }
  }
}
