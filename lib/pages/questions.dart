import 'dart:async';
import 'package:flutter/material.dart';

// lib imports
import 'package:hangman_ieee_intromeet_2023/globalVariables.dart' as global;
import 'package:hangman_ieee_intromeet_2023/pages/lose.dart';
import 'package:hangman_ieee_intromeet_2023/services/firestore.dart';
import 'package:hangman_ieee_intromeet_2023/widgets/forQuestions/answer.dart';
import 'package:hangman_ieee_intromeet_2023/widgets/forQuestions/keyboard.dart';

// google fonts imports
import 'package:google_fonts/google_fonts.dart';

// rive imports
import 'package:rive/rive.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  // firestore instance
  Firestore firestore = Firestore();

  // counter
  Timer? counterTimer;
  int counter = 45;
  bool buttonPress = true;

  void startTimer() {
    counterTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (counter > 0) {
        setState(() => counter--);
      } else if (counter <= 0 && buttonPress) {
        timer.cancel();
        firestore.decrement(global.team);
        firestore.decrement(global.team);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Lose(index: global.questionIndex);
        }));
      }
    });
  }

  // fade transition
  Timer? fadeTimer;
  bool show = true;

  void fadeTransition() {
    fadeTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        show = !show;
      });
    });
  }

  @override
  void initState() {
    startTimer();
    fadeTransition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, questionsSetState) {
        return Stack(
          children: [
            // START: background image in stack
            Image.asset(
              'assets/background.png',
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            // END: background image in stack
            // START: timer
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height / 20,
                      horizontal: MediaQuery.of(context).size.width / 20),
                  child: CircularProgressIndicator(
                    value: counter / 45,
                    valueColor: const AlwaysStoppedAnimation(Colors.green),
                    strokeWidth: 4,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height / 17,
                      horizontal: MediaQuery.of(context).size.width / 14),
                  child: Text(
                    counter.toString(),
                    style: show
                        ? GoogleFonts.ubuntu(
                            fontSize: MediaQuery.of(context).size.height / 50,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          )
                        : GoogleFonts.ubuntu(
                            fontSize: MediaQuery.of(context).size.height / 50,
                            color: Colors.transparent),
                  ),
                ),
              ],
            ),
            // END: timer
            SafeArea(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // START: Animation
                      Container(
                        width: MediaQuery.of(context).size.height / 2.2,
                        height: MediaQuery.of(context).size.height / 3.5,
                        // decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                        child: const RiveAnimation.asset(
                          'assets/rive/still.riv',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      // END: Animation
                      // START: Guess The App text
                      SizedBox(height: MediaQuery.of(context).size.height / 25),
                      Text(
                        "Guess The App",
                        style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height / 18,
                            letterSpacing: 4,
                            fontWeight: FontWeight.w700),
                      ),
                      // END: Guess The App text
                      // START: Question
                      SizedBox(height: MediaQuery.of(context).size.height / 25),
                      global.questions(context)[global.questionIndex],
                      // END: Question
                      // START: Answer
                      SizedBox(height: MediaQuery.of(context).size.height / 25),
                      WidgetsAnswer(
                        index: global.questionIndex,
                        questionsSetState: questionsSetState,
                      ),
                      // END: Answer
                      // START: keyboard
                      SizedBox(height: MediaQuery.of(context).size.height / 25),
                      WidgetsKeyboard(
                        index: global.questionIndex,
                        questionsSetState: questionsSetState,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 25),
                      // END: keyboard
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
