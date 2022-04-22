import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String _text;
  const Tag(this._text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(0.5),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.05,
          //maxWidth: MediaQuery.of(context).size.width * 0.3,
        ),
        child: OutlinedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        side: const BorderSide(color: Colors.black)))),
            onPressed: () {},
            child: Text(
              _text,
              style: TextStyle(overflow: TextOverflow.ellipsis),
            )));
  }
}
