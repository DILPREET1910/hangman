import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetsKeyboard extends StatefulWidget {
  const WidgetsKeyboard({super.key});

  @override
  State<WidgetsKeyboard> createState() => _WidgetsKeyboardState();
}

class _WidgetsKeyboardState extends State<WidgetsKeyboard> {
  List<List<String>> keys = [
    ['A', 'B', 'C', 'D', 'E', 'F', 'G'],
    ['H', 'I', 'J', 'K', 'L', 'M', 'N'],
    ['O', 'P', 'Q', 'R', 'S', 'T', 'U'],
    ['V', 'W', 'Z', 'Y', 'Z']
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: keys
          .map((list) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list
                    .map((key) => Container(
                          height: MediaQuery.of(context).size.height / 20,
                          width: MediaQuery.of(context).size.height / 20,
                          margin: EdgeInsets.symmetric(
                              vertical: MediaQuery.of(context).size.height / 200,
                              horizontal: MediaQuery.of(context).size.height/ 200),
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                        ))
                    .toList(),
              ))
          .toList(),
    );
  }
}
