import 'package:flutter/material.dart';

// google fonts imports
import 'package:google_fonts/google_fonts.dart';

class WidgetsHangmanTitle extends StatelessWidget {
  const WidgetsHangmanTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "HangMan",
      style: GoogleFonts.ubuntu(
        color: Colors.white,
        fontSize: MediaQuery.of(context).size.height / 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
      ),
    );
  }
}
