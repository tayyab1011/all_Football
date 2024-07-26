import 'package:all_football/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _navigation();
  }

  _navigation() async {
    await Future.delayed(const Duration(milliseconds: 4000), () {});
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Center(
        child: Container(
          child: Lottie.asset('assets/animations/animation.json'),
        ),
      )

    );
  }
}
