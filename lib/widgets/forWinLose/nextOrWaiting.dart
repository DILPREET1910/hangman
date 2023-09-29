import 'package:flutter/material.dart';

// lib imports
import 'package:hangman_ieee_intromeet_2023/globalVariables.dart' as global;
import 'package:hangman_ieee_intromeet_2023/pages/questions.dart';

// google fonts imports
import 'package:google_fonts/google_fonts.dart';

// spinkit imports
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WidgetsNextWait extends StatelessWidget {
  final bool start;

  const WidgetsNextWait({super.key, required this.start});

  @override
  Widget build(BuildContext context) {
    if (start) {
      return GestureDetector(
        onTap: () {
          global.questionIndex++;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return const Questions();
          }));
        },
        child: Image.asset('assets/buttons/next.png'),
      );
    } else {
      return Column(
        children: [
          Text(
            "Waiting for admin to start next question",
            style: GoogleFonts.ubuntu(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width / 20,
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
