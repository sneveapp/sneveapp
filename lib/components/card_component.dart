import 'package:flutter/cupertino.dart';
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

    return GestureDetector(
        child: Stack(children: [
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
            height: _height / 2.5,
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
      Container(
          width: _width,
          height: _height,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(_radius)),
          ),
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              CardButton(type: type),
              const SizedBox(
                width: 12,
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 25 * MediaQuery.of(context).size.width / 570,
                    fontWeight: FontWeight.bold,
                    color: Color(getTextColor())),
              ),
              const Spacer(),
              getWowButton()
            ],
          ))
    ]),
      onTap: () => {print("Card Component has been pressed")}
    );
  }

  int getColor() {
    switch (type) {
      case CardType.memory:
        return 0xffffffff;
      case CardType.event:
        return 0xff000000;
      default:
        return 0;
    }
  }

  int getTextColor() {
    switch (type) {
      case CardType.memory:
        return 0xff000000;
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
}
