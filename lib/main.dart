import 'package:flutter/material.dart';
import 'package:flutter_application_2/screen/home.dart';
import 'package:flutter_application_2/screen/login.dart';
import 'package:flutter_application_2/screen/welcome.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fluttrt Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Homescreen()
    );
  }
}
