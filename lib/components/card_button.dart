import 'package:flutter/material.dart';
import 'package:sneve/components/card_component.dart';

class CardButton extends StatelessWidget {
  final CardType type;
  const CardButton({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 12, bottom: 6),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: OutlinedButton(
          onPressed: () => {print("")},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color(getInvertedColor()).withOpacity(0.9)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0))),
          ),
          child: Container(
              padding:
                  const EdgeInsets.only(right: 0, left: 0, bottom: 4, top: 4),
              child: Row(
                children: [
                  Icon(getIcon(), color: Color(getColor())),
                  SizedBox(width: 8),
                  Text(
                    getText(),
                    style: TextStyle(
                        color: Color(getColor()), fontWeight: FontWeight.bold),
                  )
                ],
              )),
        ));
  }

  int getColor() {
    switch (type) {
      case CardType.memory:
        return 0xff000000;
      case CardType.event:
        return 0xffffffff;
      default:
        return 0;
    }
  }

  int getInvertedColor() {
    switch (type) {
      case CardType.memory:
        return 0xffffffff;
      case CardType.event:
        return 0xff000000;
      default:
        return 0;
    }
  }

  String getText() {
    switch (type) {
      case CardType.memory:
        return "Relive";
      case CardType.event:
        return "Dive In";
      default:
        return "";
    }
  }

  IconData getIcon() {
    switch (type) {
      case CardType.memory:
        return Icons.replay;
      case CardType.event:
        return Icons.play_arrow;
      default:
        return Icons.not_interested;
    }
  }
}
