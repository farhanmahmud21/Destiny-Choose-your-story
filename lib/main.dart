import 'package:destiny/stpryBrain.dart';
import 'package:flutter/material.dart';

StoryBrain storybrain = StoryBrain();
void main() {
  runApp(Destiny());
}

class Destiny extends StatefulWidget {
  const Destiny({super.key});

  @override
  State<Destiny> createState() => _DestinyState();
}

class _DestinyState extends State<Destiny> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/back.png'), fit: BoxFit.cover),
          ),
          //child: Image.asset(),
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 12),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 6,
                child: Center(
                  child: Text(
                    storybrain.getStoryTitle(),
                    style: TextStyle(color: Colors.amber, fontSize: 23),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 204, 20, 20),
                        foregroundColor: Colors.black),
                    onPressed: () {
                      setState(() {
                        storybrain.nextStory(1);
                      });
                    },
                    child: Text(
                      storybrain.getChoice1(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Visibility(
                    visible: storybrain.buttonVisible(),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.black),
                      onPressed: () {
                        setState(() {
                          storybrain.nextStory(2);
                        });
                      },
                      child: Text(
                        storybrain.getChoice2(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
