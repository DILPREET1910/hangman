import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetsAnswer extends StatefulWidget {
  final String alphabet;

  const WidgetsAnswer({super.key, required this.alphabet});

  @override
  State<WidgetsAnswer> createState() => _WidgetsAnswerState();
}

class _WidgetsAnswerState extends State<WidgetsAnswer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
              widget.alphabet,
              style: GoogleFonts.ubuntu(
                  color: Colors.white, fontSize: MediaQuery.of(context).size.width / 13),
            ),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width / 40),
      ],
    );
  }
}
