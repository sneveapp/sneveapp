import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WowButton extends StatefulWidget {
  final bool isWow;

  const WowButton({Key? key, required this.isWow}) : super(key: key);

  @override
  State<WowButton> createState() => _WowButtonState();
}

class _WowButtonState extends State<WowButton> {
  late bool _isWow = widget.isWow;

  void _toggleWow() {
    if (kDebugMode) {
      print('Wow button has been pressed.\nButton state is $_isWow');
    }
    setState(() {
      _isWow = !_isWow;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Text(_isWow ? "😮" : "😐", style: Theme.of(context).textTheme.button),
      ),
      onTap: _toggleWow,
    );
  }
}
