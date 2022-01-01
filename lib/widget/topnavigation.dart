// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';

class TopNavigation extends StatelessWidget {
  const TopNavigation({Key? key}) : super(key: key);

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
          Container(
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
          Expanded(
            // Nama dan Poto
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Nama",
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
