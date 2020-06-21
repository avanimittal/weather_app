import 'package:flutter/material.dart';

import 'home.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: Home(),
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.white
      ),
    );
  }
}
