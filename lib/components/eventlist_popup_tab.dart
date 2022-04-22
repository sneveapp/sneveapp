import 'dart:ffi';

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
        print("${widget.text} clicked");
        widget.handler();
      },
      child: Text(
        widget.text,
        style: TextStyle(
            color: widget.selected ? Colors.deepOrange : Colors.black),
      ),
    );
  }
}
