import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EventlistPopupTab extends StatefulWidget {
  final String text;
  final bool selected;
  final VoidCallback handler;

  const EventlistPopupTab(
      {Key? key,
      required this.text,
      required this.handler,
      required this.selected})
      : super(key: key);

  @override
  State<EventlistPopupTab> createState() => _EventlistPopupTabState();
}

class _EventlistPopupTabState extends State<EventlistPopupTab> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (kDebugMode) {
            print("${widget.text} clicked");
          }
          widget.handler();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(
                width: 1,
                color: Colors.deepOrange[700]!
                    .withOpacity(widget.selected ? 0.4 : 0)),
          ),
          padding: const EdgeInsets.only(top: 4, bottom: 4, right: 8, left: 8),
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.selected ? Colors.black : Colors.black,
              fontSize: 15,
            ),
          ),
        ));
  }
}
