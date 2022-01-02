import "package:flutter/material.dart";
import 'dart:async';

import 'package:it_fair_web_1/pages/mainpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    setState(() {
      _initializationMemory();
    });
  }

  _initializationMemory() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setInt('botplayer', 100).then((value) => print("$value"));
    await prefs.setInt('playerleft', 99).then((value) => print("$value"));

    await prefs.setInt('position', 0).then((value) => print("$value"));
    await prefs.setInt('win', 2).then((value) => print("$value"));
    await prefs.setInt('position rate', 3).whenComplete(() => timer());
    // prefs = pref;
  }

  void timer() {
    Timer(const Duration(milliseconds: 3000), () {
      // set your desired delay time here
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MainPage(
                prefs: prefs,
              )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
