import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_projects/main.dart';

import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
      )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/images/envelope.jpg')),
              Text('Celebrare', style: TextStyle(fontSize: 35, fontFamily: 'FontMain'),),
              
              Padding(
                padding: const EdgeInsets.only(left: 150.0),
                child: Text('Digital Invitations', style: TextStyle(fontSize: 10),),
              )
            ],
          ),
      )
    );
  }
}
