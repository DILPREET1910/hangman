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

List<Map<String, bool>> answerGuessed = [
  {
    'R': false,
    'E': false,
    'D': false,
    'I': false,
    'T': false,
  },
  {
    'S': false,
    'P': false,
    'O': false,
    'T': false,
    'I': false,
    'F': false,
    'Y': false,
  },
  {
    'D': false,
    'I': false,
    'G': false,
    'L': false,
    'O': false,
    'C': false,
    'K': false,
    'E': false,
    'R': false,
  },
  {
    'A': false,
    'M': false,
    'Z': false,
    'O': false,
    'N': false,
  },
];

int questionIndex = 0;

int wrongCounter = 0;

Map<int, String> hangmanAnimation = {
  0: 'assets/rive/still.riv',
  1: 'assets/rive/first.riv',
  2: 'assets/rive/second.riv',
  3: 'assets/rive/third.riv',
  4: 'assets/rive/fourth.riv',
};
