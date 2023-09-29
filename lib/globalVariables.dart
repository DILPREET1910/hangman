import 'package:flutter/material.dart';

// google fonts imports
import 'package:google_fonts/google_fonts.dart';

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
    Container(
      padding:
          EdgeInsets.symmetric(vertical: 0, horizontal: MediaQuery.of(context).size.width / 90),
      child: Text(
        "Where you’ll find people chasing imaginary creatures with more enthusiasm than they chase their life goals",
        textAlign: TextAlign.center,
        style: GoogleFonts.ubuntu(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.height / 40,
          letterSpacing: 0,
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
    Container(
      padding:
          EdgeInsets.symmetric(vertical: 0, horizontal: MediaQuery.of(context).size.width / 90),
      child: Text(
        "The digital vortex where pants are optional, but technical difficulties are mandatory.",
        textAlign: TextAlign.center,
        style: GoogleFonts.ubuntu(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.height / 40,
          letterSpacing: 0,
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
    Container(
      padding:
          EdgeInsets.symmetric(vertical: 0, horizontal: MediaQuery.of(context).size.width / 90),
      child: Text(
        "Sirf 2 minutes hai tumhare pass",
        textAlign: TextAlign.center,
        style: GoogleFonts.ubuntu(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.height / 40,
          letterSpacing: 0,
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
    Container(
      padding:
          EdgeInsets.symmetric(vertical: 0, horizontal: MediaQuery.of(context).size.width / 90),
      child: Text(
        "Out of this world trust issues",
        textAlign: TextAlign.center,
        style: GoogleFonts.ubuntu(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.height / 40,
          letterSpacing: 0,
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
    Container(
      padding:
          EdgeInsets.symmetric(vertical: 0, horizontal: MediaQuery.of(context).size.width / 90),
      child: Text(
        "💿+🔌",
        textAlign: TextAlign.center,
        style: GoogleFonts.ubuntu(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.height / 20,
          letterSpacing: 0,
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
    Container(
      padding:
          EdgeInsets.symmetric(vertical: 0, horizontal: MediaQuery.of(context).size.width / 90),
      child: Text(
        "🎮+🏬",
        textAlign: TextAlign.center,
        style: GoogleFonts.ubuntu(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.height / 20,
          letterSpacing: 0,
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
    Container(
      padding:
          EdgeInsets.symmetric(vertical: 0, horizontal: MediaQuery.of(context).size.width / 90),
      child: Text(
        "👓+🛒",
        textAlign: TextAlign.center,
        style: GoogleFonts.ubuntu(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.height / 20,
          letterSpacing: 0,
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
    Container(
      padding:
          EdgeInsets.symmetric(vertical: 0, horizontal: MediaQuery.of(context).size.width / 90),
      child: Text(
        "🔥✡️🔥",
        textAlign: TextAlign.center,
        style: GoogleFonts.ubuntu(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.height / 20,
          letterSpacing: 0,
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
  ];
}

List<List<String>> answers = [
  ['R', 'E', 'D', 'D', 'I', 'T'],
  ['S', 'P', 'O', 'T', 'I', 'F', 'Y'],
  ['D', 'I', 'G', 'I', 'L', 'O', 'C', 'K', 'E', 'R'],
  ['A', 'M', 'A', 'Z', 'O', 'N'],
  ['P', 'O', 'K', 'E', 'M', 'O', 'N', 'G', 'O'],
  ['Z', 'O', 'O', 'M'],
  ['B', 'E', 'R', 'E', 'A', 'L'],
  ['A', 'M', 'O', 'N', 'G', 'U', 'S'],
  ['D', 'I', 'S', 'C', 'O', 'R', 'D'],
  ['P', 'L', 'A', 'Y', 'S', 'T', 'O', 'R', 'E'],
  ['L', 'E', 'N', 'S', 'K', 'A', 'R', 'T'],
  ['B', 'Y', 'J', 'U', 'S'],
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
  {
    'P': false,
    'O': false,
    'K': false,
    'E': false,
    'M': false,
    'N': false,
    'G': false,
  },
  {
    'Z': false,
    'O': false,
    'M': false,
  },
  {
    'B': false,
    'E': false,
    'R': false,
    'A': false,
    'L': false,
  },
  {
    'A': false,
    'M': false,
    'O': false,
    'N': false,
    'G': false,
    'U': false,
    'S': false,
  },
  {
    'D': false,
    'I': false,
    'S': false,
    'C': false,
    'O': false,
    'R': false,
  },
  {
    'P': false,
    'L': false,
    'A': false,
    'Y': false,
    'S': false,
    'T': false,
    'O': false,
    'R': false,
    'E': false,
  },
  {
    'L': false,
    'E': false,
    'N': false,
    'S': false,
    'K': false,
    'A': false,
    'R': false,
    'T': false,
  },
  {
    'B': false,
    'Y': false,
    'J': false,
    'U': false,
    'S': false,
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

bool teamFlag = false;
bool nameFlag = false;