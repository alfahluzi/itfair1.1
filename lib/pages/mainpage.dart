import 'package:flutter/material.dart';
import 'package:it_fair_web_1/pages/home.dart';
import 'package:it_fair_web_1/pages/quis.dart';
import 'package:it_fair_web_1/widget/TopNavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.prefs}) : super(key: key);
  final SharedPreferences prefs;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _pageIndex = 0;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    prefs = widget.prefs;
    setState(() {});
  }

  void updatePage(int pageIndex) {
    setState(() {
      _pageIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TopNavigation(updatePage: updatePage),
        ],
      ),
      body: _pageIndex == 0
          ? HomePage(
              updatePage: updatePage,
              prefs: prefs,
            )
          : QuisPage(
              prefs: prefs,
              updatePage: updatePage,
            ),
    );
  }
}
