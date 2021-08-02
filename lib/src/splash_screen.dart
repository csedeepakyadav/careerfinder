import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double iconSize = 0.0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        iconSize = 0.2;
      });
    });

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/preauthscreen');
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                end: const Alignment(0.0, 0.0),
                begin: const Alignment(0.0, 0.5),
                colors: [Color(0xFF4674e4), Color(0xFF8954e8)])),
        child: Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            width: height * iconSize,
            height: height * iconSize,
            color: Colors.transparent,
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: height * 0.22,
            ),
          ),
        ),
      ),
    );
  }
}
