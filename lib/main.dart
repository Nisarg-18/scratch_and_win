import 'package:flutter/material.dart';

import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Scratch and Win Game",
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
