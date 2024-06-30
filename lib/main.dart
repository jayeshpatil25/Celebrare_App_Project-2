
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_projects/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}






