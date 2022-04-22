// Class for Backend

import 'package:sneve/services/sneve_user.dart';

class EventList {
  String name;
  String description;
  DateTime creationDate;
  final List<EventList> alike;
  int numberOfSaves;
  int numberOfStarts;
  SneveUser author;
  List activities;

  EventList(
      {required this.name,
      required this.description,
      required this.alike,
      required this.creationDate,
      required this.numberOfSaves,
      required this.numberOfStarts,
      required this.author,
      required this.activities});


  String getCreationDateAsString() {
    return "${creationDate.day}/${creationDate.month}/${creationDate.year}";
  }
}
