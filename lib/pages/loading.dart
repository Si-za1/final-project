import 'package:flutter/material.dart';
import 'package:search/pages/home.dart';
import 'package:splashscreen/splashscreen.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SplashScreen(
              seconds: 5,
              image: Image.asset('images/icon.jpeg'),
              loaderColor: Colors.white,
              backgroundColor: Colors.black,
              photoSize: 150.0,
              navigateAfterSeconds: Home(),
          ),
        ),
      ),
    );
  }
}