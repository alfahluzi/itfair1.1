import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.updatePage, required this.prefs})
      : super(key: key);
  final Function(int) updatePage;
  final SharedPreferences prefs;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Function(int) updatePage;
  late SharedPreferences prefs = widget.prefs;

  @override
  void initState() {
    super.initState();
    setState(() {
      _memoryload();
      prefs = widget.prefs;
    });
    updatePage = widget.updatePage;
  }

  /////////////////////////////
  late int _position;
  late int _totalPeserta;
  late int _win;
  late int _positionRate;
  /////////////////////////////

  _memoryload() {
    _position = prefs.getInt('position')!;
    _totalPeserta = prefs.getInt('botplayer')!;
    _win = prefs.getInt('win')!;
    _positionRate = prefs.getInt('position rate')!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          color: const Color(0xffF44786),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Knowledge Is Powerfull",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              Text(
                "Bertahan Hidup Dengan Pengetahuan",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: const Color(0xff249F9C),
                  margin: const EdgeInsets.all(50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BorderedText(
                              strokeWidth: 4,
                              strokeColor: Colors.white,
                              child: const Text(
                                "Squiz Game",
                                style: TextStyle(
                                  color: Color(0xffED1B76),
                                  fontSize: 80,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            InkWell(
                              onTap: () async {
                                await prefs
                                    .setInt("playerleft", 100)
                                    .whenComplete(() => updatePage(1));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 235,
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: Color(0xffF44786),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(48)),
                                ),
                                child: const Text(
                                  "Start Game",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 35,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        color: const Color(0xff249F9C),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(
                            "Rule : Dont Wrong!",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: const Color(0xff249F9C),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Last Squiz",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                          ),
                        ),
                        Text(
                          "Position $_position/$_totalPeserta",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          width: MediaQuery.of(context).size.width,
                          height: 2,
                          color: Colors.black,
                        ),
                        const Text(
                          "Win",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                          ),
                        ),
                        Text(
                          "$_win",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          width: MediaQuery.of(context).size.width,
                          height: 2,
                          color: Colors.black,
                        ),
                        const Text(
                          "Position Rate",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                          ),
                        ),
                        Text(
                          "$_positionRate",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          width: MediaQuery.of(context).size.width,
                          height: 2,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
