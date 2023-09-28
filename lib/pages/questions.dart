import 'package:flutter/material.dart';

// lib imports
import 'package:hangman_ieee_intromeet_2023/globalVariables.dart' as global;
import 'package:hangman_ieee_intromeet_2023/widgets/forQuestions/answer.dart';

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
  @override
  Widget build(BuildContext context) {
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
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 3.5,
                    decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                    child: const RiveAnimation.asset(
                      'assets/rive/still.riv',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  // END: Animation
                  // START: Guess The App text
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  Text(
                    "Guess The App",
                    style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontSize: 40,
                        letterSpacing: 4,
                        fontWeight: FontWeight.w700),
                  ),
                  // END: Guess The App text
                  // START: Question
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  global.questions(context)[2],
                  // END: Question
                  // START: Answer
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: global.answers[2]
                          .map((element) => WidgetsAnswer(alphabet: element))
                          .toList()),
                  // END: Answer
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
