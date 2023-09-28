import 'package:flutter/material.dart';

// lib imports
import 'package:hangman_ieee_intromeet_2023/pages/questions.dart';

// google fonts imports
import 'package:google_fonts/google_fonts.dart';

// spinkit imports
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WidgetsPlayWait extends StatelessWidget {
  final bool start;

  const WidgetsPlayWait({super.key, required this.start});

  @override
  Widget build(BuildContext context) {
    if (start) {
      return GestureDetector(
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return Questions();
          }));
        },
        child: Image.asset('assets/buttons/play.png'),
      );
    } else {
      return Column(
        children: [
          Text(
            "Waiting for admin to start the game",
            style: GoogleFonts.ubuntu(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
          const SpinKitCircle(color: Colors.white),
        ],
      );
    }
  }
}
