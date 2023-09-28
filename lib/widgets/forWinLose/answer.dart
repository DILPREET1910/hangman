import 'package:flutter/material.dart';

// lib imports
import 'package:hangman_ieee_intromeet_2023/globalVariables.dart' as global;

// google fonts imports
import 'package:google_fonts/google_fonts.dart';

class WidgetsAnswerWinLose extends StatefulWidget {
  final int index;
  final Color color;

  const WidgetsAnswerWinLose({super.key, required this.index, required this.color});

  @override
  State<WidgetsAnswerWinLose> createState() => _WidgetsAnswerWinLoseState();
}

class _WidgetsAnswerWinLoseState extends State<WidgetsAnswerWinLose> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: global.answers[widget.index]
          .map((alphabet) => Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 18,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 3, color: widget.color),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        alphabet,
                        style: GoogleFonts.ubuntu(
                            color: widget.color, fontSize: MediaQuery.of(context).size.height / 26),
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
