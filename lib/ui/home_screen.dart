import 'package:flutter/material.dart';
import 'package:tutedude_assignment_3/model/reaction.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pos = 0;
  var reaction = [
    Reaction(
        emoji: "👎",
        toolbarColor: Colors.red[800] as Color,
        backgroundColor: Colors.red[100] as Color),
    Reaction(
        emoji: "😟",
        toolbarColor: Colors.deepOrange[800] as Color,
        backgroundColor: Colors.deepOrange[100] as Color),
    Reaction(
        emoji: "😕",
        toolbarColor: Colors.grey[700] as Color,
        backgroundColor: Colors.grey[200] as Color),
    Reaction(
        emoji: "😐",
        toolbarColor: Colors.blueGrey[700] as Color,
        backgroundColor: Colors.blueGrey[100] as Color),
    Reaction(
        emoji: "🙂",
        toolbarColor: Colors.lightGreen[700] as Color,
        backgroundColor: Colors.lightGreen[100] as Color),
    Reaction(
        emoji: "👍",
        toolbarColor: Colors.green[800] as Color,
        backgroundColor: Colors.green[100] as Color),
    Reaction(
        emoji: "😊",
        toolbarColor: Colors.teal[800] as Color,
        backgroundColor: Colors.teal[100] as Color),
    Reaction(
        emoji: "✨",
        toolbarColor: Colors.purple[800] as Color,
        backgroundColor: Colors.purple[100] as Color),
    Reaction(
        emoji: "⭐",
        toolbarColor: Colors.amber[800] as Color,
        backgroundColor: Colors.amber[100] as Color),
    Reaction(
        emoji: "💯",
        toolbarColor: Colors.blue[800] as Color,
        backgroundColor: Colors.blue[100] as Color),
  ];

  void changeMood(bool isHappy) {
    setState(() {
      if (isHappy) {
        pos++;
        if (pos >= reaction.length) {
          pos = 0;
        }
      } else {
        pos--;
        if (pos < 0) {
          pos = reaction.length - 1;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignment 3"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
        backgroundColor: reaction[pos].toolbarColor,
      ),
      backgroundColor: reaction[pos].backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(reaction[pos].emoji, style: TextStyle(fontSize: 50))),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  changeMood(false);
                },
                child: const Text("Dampen Mood"),
              ),
              ElevatedButton(
                onPressed: () {
                  changeMood(true);
                },
                child: const Text("Lift Mood"),
              ),
            ],
          ),
          Slider(
              value: pos.toDouble(),
              min: 0,
              activeColor: reaction[pos].toolbarColor,
              thumbColor: Colors.white,
              max: reaction.length.toDouble() - 1,
              onChanged: (double value) {
                setState(() {
                  pos = value.toInt();
                });
              })
        ],
      ),
    );
  }
}
