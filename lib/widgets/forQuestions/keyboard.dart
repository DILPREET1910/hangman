import 'package:flutter/material.dart';

// lib imports
import 'package:hangman_ieee_intromeet_2023/globalVariables.dart' as global;
import 'package:hangman_ieee_intromeet_2023/pages/win.dart';
import 'package:hangman_ieee_intromeet_2023/pages/lose.dart';

// google fonts imports
import 'package:google_fonts/google_fonts.dart';

class WidgetsKeyboard extends StatefulWidget {
  final int index;
  final StateSetter questionsSetState;

  const WidgetsKeyboard({super.key, required this.index, required this.questionsSetState});

  @override
  State<WidgetsKeyboard> createState() => _WidgetsKeyboardState();
}

class _WidgetsKeyboardState extends State<WidgetsKeyboard> {
  List<List<String>> keys = [
    ['A', 'B', 'C', 'D', 'E', 'F', 'G'],
    ['H', 'I', 'J', 'K', 'L', 'M', 'N'],
    ['O', 'P', 'Q', 'R', 'S', 'T', 'U'],
    ['V', 'W', 'X', 'Y', 'Z']
  ];

  Set<String> selectedAlphabets = {};

  // set wrong counter to 0 after next question is loaded
  @override
  void initState() {
    global.wrongCounter = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: keys
          .map((list) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list
                    .map((key) => GestureDetector(
                          onTap: () {
                            if (global.answerGuessed[widget.index].containsKey(key)) {
                              global.answerGuessed[widget.index][key] = true;
                              widget.questionsSetState(() {});
                            } else {
                              global.wrongCounter++;
                              widget.questionsSetState(() {});
                            }

                            setState(() {
                              selectedAlphabets.add(key);
                            });

                            // checks after each click
                            bool answered = true;
                            global.answers[widget.index].forEach((element) {
                              if (!selectedAlphabets.contains(element)) answered = false;
                            });

                            if (answered) {
                              global.questionIndex++;
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return Win(index: widget.index);
                              }));
                            }
                            if (global.wrongCounter == 4) {
                              global.questionIndex++;
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return Lose(index: widget.index);
                              }));
                            }
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height / 20,
                            width: MediaQuery.of(context).size.height / 20,
                            margin: EdgeInsets.symmetric(
                                vertical: MediaQuery.of(context).size.height / 200,
                                horizontal: MediaQuery.of(context).size.height / 200),
                            decoration: BoxDecoration(
                              color: selectedAlphabets.contains(key)
                                  ? (global.answers[widget.index].contains(key)
                                      ? Colors.green
                                      : Colors.red)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Center(
                              child: Text(
                                key,
                                style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height / 25,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ))
          .toList(),
    );
  }
}
