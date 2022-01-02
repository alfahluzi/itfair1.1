// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:audioplayers/audioplayers.dart';

class TopNavigation extends StatefulWidget {
  const TopNavigation({Key? key, required this.updatePage}) : super(key: key);
  final Function(int) updatePage;

  @override
  State<TopNavigation> createState() => _TopNavigationState();
}

class _TopNavigationState extends State<TopNavigation> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isSwitchOn = false;

  @override
  void initState() {
    super.initState();
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    setState(() {
      if (isSwitchOn) {
        playBGM(
            "assets/audio/Squid Game OST - Pink Soldiers (Extended Ver.).mp3");
        resumeBGM();
      } else {
        stopBGM();
      }
    });
  }

  void stopBGM() async {
    await audioPlayer.release();
    await audioPlayer.stop();
  }

  void playBGM(String url) async {
    // stopBGM();
    await audioPlayer.play(url, isLocal: true);
  }

  void resumeBGM() async {
    audioPlayer.resume();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff249F9C),
      height: 110,
      width: MediaQuery.of(context).size.width,
      alignment: AlignmentDirectional.center,
      child: Row(
        children: [
          // Squiz Text
          InkWell(
            onTap: () {
              widget.updatePage(0);
            },
            child: Container(
              height: 110,
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              child: BorderedText(
                strokeWidth: 4,
                strokeColor: Colors.white,
                child: const Text(
                  "Squiz Game",
                  style: TextStyle(
                    color: Color(0xffED1B76),
                    fontSize: 32,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            height: MediaQuery.of(context).size.height,
            width: 2,
            color: Colors.black,
          ),
          const Text(
            "BGM",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          Switch(
            value: isSwitchOn,
            onChanged: (bool value) {
              isSwitchOn = value;
              setState(() {
                if (isSwitchOn) {
                  playBGM(
                      "assets/audio/Squid Game OST - Pink Soldiers (Extended Ver.).mp3");
                  resumeBGM();
                } else {
                  stopBGM();
                }
              });
            },
          ),
          Expanded(
            // Nama dan Poto
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Aditya",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
