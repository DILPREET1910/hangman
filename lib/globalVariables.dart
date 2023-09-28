import 'package:flutter/material.dart';

String team = "";

List<Widget> questions(context) {
  return [
    Container(
      height: MediaQuery.of(context).size.height / 10,
      decoration: BoxDecoration(
        border: Border.all(width: 5, color: Colors.white),
      ),
      child: Image.asset(
        'assets/ui/reddit.png',
      ),
    ),
    Container(
      height: MediaQuery.of(context).size.height / 10,
      decoration: BoxDecoration(
        border: Border.all(width: 5, color: Colors.white),
      ),
      child: Image.asset(
        'assets/ui/spotify.png',
      ),
    ),
    Container(
      height: MediaQuery.of(context).size.height / 10,
      decoration: BoxDecoration(
        border: Border.all(width: 5, color: Colors.white),
      ),
      child: Image.asset(
        'assets/ui/digilocker.png',
      ),
    ),
    Container(
      height: MediaQuery.of(context).size.height / 10,
      decoration: BoxDecoration(
        border: Border.all(width: 5, color: Colors.white),
      ),
      child: Image.asset(
        'assets/ui/amazon.jpg',
      ),
    ),
  ];
}

List<List<String>> answers = [
  ['R', 'E', 'D', 'D', 'I', 'T'],
  ['S', 'P', 'O', 'T', 'I', 'F', 'Y'],
  ['D', 'I', 'G', 'I', 'L', 'O', 'C', 'K', 'E', 'R'],
  ['A', 'M', 'A', 'Z', 'O', 'N'],
];

List<List<bool>> answerGuessed = [
  [false, false, false, false, false, false],
  [false, false, false, false, false, false, false],
  [false, false, false, false, false, false, false, false, false, false],
  [false, false, false, false, false, false],
];
