import 'package:flutter/material.dart';
import 'package:sneve/components/card_component.dart';
import 'package:sneve/components/wow_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(button: TextStyle(fontSize: 20))),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: const [
        CardComponent(
          type: CardType.memory,
          name: "Having dinner at Deeba",
          imageUrl:
              "https://media-cdn.tripadvisor.com/media/photo-s/05/32/84/c6/interno.jpg",
        ),
        CardComponent(
          type: CardType.event,
          name: "Working on Sneve!",
          imageUrl:
              "https://www.ganz-muenchen.de/Media/bilder%20gastro/cafes/starbucks/leopoldstrasse/041114opening/041114starbucks_op35haus.jpg",
        )
      ],
    )));
  }
}
