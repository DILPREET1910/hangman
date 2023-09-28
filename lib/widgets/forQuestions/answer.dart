import 'package:flutter/material.dart';

// lib imports
import 'package:hangman_ieee_intromeet_2023/globalVariables.dart' as global;

// google fonts imports
import 'package:google_fonts/google_fonts.dart';

class WidgetsAnswer extends StatefulWidget {
  final int index;
  final StateSetter questionsSetState;

  const WidgetsAnswer({super.key, required this.index, required this.questionsSetState});

  @override
  State<WidgetsAnswer> createState() => _WidgetsAnswerState();
}

class _WidgetsAnswerState extends State<WidgetsAnswer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: global.answers[widget.index]
          .map((alphabet) => Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 18,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 3, color: Colors.white),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        global.answerGuessed[widget.index][alphabet]! ? alphabet : "",
                        style: GoogleFonts.ubuntu(
                            color: Colors.white, fontSize: MediaQuery.of(context).size.height / 26),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 40),
                ],
              ))
          .toList(),
    );
  }
}
