import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> boxIds = [];
  int luckyNumber = 0;
  var lucky = AssetImage('images/rupee.png');
  var circle = AssetImage('images/circle.png');
  var unlucky = AssetImage('images/sadFace.png');
  var counter = 0;

  @override
  void initState() {
    super.initState();
    boxIds = List<String>.generate(25, (index) => "empty");
    generateNumber();
  }

  generateNumber() {
    int rnd = Random().nextInt(25);
    setState(() {
      luckyNumber = rnd;
    });
  }

  String message = "";
  playGame(int i) {
    if (luckyNumber == i) {
      setState(() {
        boxIds[i] = 'lucky';
        counter++;
      });
    } else {
      setState(() {
        boxIds[i] = 'unlucky';
        counter++;
      });
    }
  }

  AssetImage getImage(String a) {
    // String currentState = boxIds[index];
    switch (a) {
      case "lucky":
        return lucky;
      case "unlucky":
        return unlucky;
    }
    return circle;
  }

// bool ishide;
  // var hideShow = [];
  showAll() {
    setState(() {
      boxIds = List<String>.filled(25, "unlucky");
      boxIds[luckyNumber] = "lucky";
      // hideShow = ["Hide All","Show All"];
    });
  }

  reset() {
    setState(() {
      boxIds = List<String>.filled(25, "empty");
      generateNumber();
      counter = 0;
    });
  }

  nullButton() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Center(child: Text('Scratch and Win')),
      ),
      body: Container(
        color: Colors.orange[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(20.0),
                itemCount: boxIds.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow[200],
                      ),
                      onPressed: () {
                        counter > 4 ? nullButton() : this.playGame(index);
                      },
                      child: Image(
                        image: this.getImage(boxIds[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: 150.0,
              child: Column(
                children: [
                  Text(
                    'You get only 5 turns',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.orange[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        )),
                    onPressed: () {
                      showAll();
                    },
                    child: Text(
                      'Show All',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 150.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )),
                onPressed: () {
                  reset();
                },
                child: Text(
                  'Reset Game',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
