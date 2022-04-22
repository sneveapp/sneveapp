import 'package:flutter/cupertino.dart';

import 'activity.dart';

class Event extends Activity {
  @override
  final String imageUrl;
  @override
  final String name;

  Event({required this.imageUrl, required this.name});
}
