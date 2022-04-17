import 'package:flutter/material.dart';
import 'package:sneve/components/card_component.dart';

class CardButton extends StatelessWidget {
  final CardType type;
  const CardButton({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => {print("")},
      style: ButtonStyle(
        side: MaterialStateProperty.all(
            BorderSide(
                color: Color(getColor()),
                width: 3.0,
                style: BorderStyle.solid)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),

      ),
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Icon(getIcon(), color: Color(getColor())),
              SizedBox(width: 4),
              Text(getText(), style: TextStyle(color: Color(getColor())),)
            ],
          )
      ),
    );
  }

  int getColor() {
    switch(type) {
      case CardType.memory:
        return 0xff000000;
      case CardType.event:
        return 0xffffffff;
      default:
        return 0;
    }
  }

  String getText() {
    switch(type) {
      case CardType.memory:
        return "Relive";
      case CardType.event:
        return "Dive In";
      default:
        return "";
    }
  }

  IconData getIcon() {
    switch(type) {
      case CardType.memory:
        return Icons.replay;
      case CardType.event:
        return Icons.play_arrow;
      default:
        return Icons.not_interested;
    }
  }
}
