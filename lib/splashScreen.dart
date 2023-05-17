import 'dart:async';

import 'package:bmi/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MyHomePage(),));
    });

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue.shade100,
        child: Center(
          child: Container(
            width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("BMI" , style: TextStyle(
                      fontSize: 80,
                      fontFamily: "Bungee"
                  ),),

                  Text("CALCULATOR" , style: TextStyle(
                      fontSize: 35,
                      fontFamily: "Bungee"
                  ),),
                ],
              )
          ),
        ),
      ),
    );
  }
}