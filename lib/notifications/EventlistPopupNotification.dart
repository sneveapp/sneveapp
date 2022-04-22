import 'package:flutter/cupertino.dart';
import 'package:sneve/services/eventlist.dart';

class EventlistPopupNotification extends Notification {
  final EventList eventlist;
  const EventlistPopupNotification({required this.eventlist}) : super();
}
