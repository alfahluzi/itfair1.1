import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

class Question {
  String quest;
  bool answer;
  Question({required this.quest, required this.answer});
}

class QuisPage extends StatefulWidget {
  const QuisPage({Key? key, required this.prefs, required this.updatePage})
      : super(key: key);
  final SharedPreferences prefs;
  final Function(int) updatePage;

  @override
  _QuisPageState createState() => _QuisPageState();
}

class _QuisPageState extends State<QuisPage> {
  late SharedPreferences prefs = widget.prefs;
  late Function(int) updatePage;

  @override
  void initState() {
    super.initState();
    setState(() {
      _memoryLoad();
      prefs = widget.prefs;
    });
    updatePage = widget.updatePage;
  }

  ///////////////////
  List<Question> soal = [];
  Question soalSekarang = Question(quest: "", answer: true);
  Random random = Random();
  late int botplayer;
  late int playerleft;
  late int totalpeserta;
  ///////////////////

  _memoryLoad() {
    botplayer = prefs.getInt("botplayer")!;
    playerleft = prefs.getInt("playerleft")!;
    totalpeserta = prefs.getInt('botplayer')!;
  }

  @override
  Widget build(BuildContext context) {
    soal = [
      Question(
        quest: "Indonesia merdeka pada tahun 1945",
        answer: true,
      ),
      Question(
        quest: "Hulk berwarna biru",
        answer: false,
      ),
      Question(
        quest: "Ir. Soekarno adalah bapak proklamator Indonesia",
        answer: true,
      ),
    ];
    int index = random.nextInt(soal.length);
    soalSekarang = soal[index];
    soal.removeAt(index);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 200),
      color: const Color(0xffF44786),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              color: const Color(0xff249F9C),
              child: Column(
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Text(
                        soalSekarang.quest,
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: Text(
                            "$playerleft player left",
                            style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: const Text(
                            "00:00",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {});
                        cekJawaban(true);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: const Color(0xff249F9C),
                        child: const Text(
                          "Benar",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 50),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {});
                        cekJawaban(false);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: const Color(0xff249F9C),
                        child: const Text(
                          "Salah",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void cekJawaban(bool jawaban) async {
    int deletedbot = 0;
    for (var i = 0; i < botplayer; i++) {
      if (random.nextInt(100) > 97) {
        deletedbot++;
      }
    }
    int wincon = 0;
    int newPlayerleft = playerleft - deletedbot;
    if (newPlayerleft < 1) {
      wincon = 1;
      int newWin = prefs.getInt("win")! + 1;
      await prefs.setInt("win", newWin);
    }
    if (jawaban != soalSekarang.answer) {
      wincon = 2;
      int newPosRate = prefs.getInt("position rate")! + playerleft;
      newPosRate == 0 ? newPosRate = 1 : newPosRate = newPosRate / 2 as int;
      prefs.setInt('pos rate', newPosRate);
    }
    await prefs.setInt("playerleft", newPlayerleft);
    setState(() {
      _memoryLoad();
      prefs.setInt('botplayer', botplayer);
      prefs.setInt('position', playerleft);
      if (wincon > 0) {
        if (wincon == 1) {}
        updatePage(0);
      } else {
        updatePage(1);
      }
    });
  }
}
