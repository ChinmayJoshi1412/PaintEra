import 'package:flutter/material.dart';
import 'package:paintera/Screens/Classification_Page.dart';
import 'package:paintera/Navigation.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigation()
    );
  }
}
