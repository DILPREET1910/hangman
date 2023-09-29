import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// lib imports
import 'package:hangman_ieee_intromeet_2023/services/firestore.dart';
import 'package:hangman_ieee_intromeet_2023/widgets/hangmanTitle.dart';
import 'package:hangman_ieee_intromeet_2023/widgets/noGlow.dart';
import 'package:hangman_ieee_intromeet_2023/widgets/forWinLose/nextOrWaiting.dart';
import 'package:hangman_ieee_intromeet_2023/widgets/forWinLose/answer.dart';

// google fonts imporst
import 'package:google_fonts/google_fonts.dart';

// rive imports
import 'package:rive/rive.dart';

class Lose extends StatefulWidget {
  final int index;

  const Lose({super.key, required this.index});

  @override
  State<Lose> createState() => _LoseState();
}

class _LoseState extends State<Lose> {
  // firestore instance
  Firestore firestore = Firestore();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firestore.questionStatus(widget.index + 2),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
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
                    body: RefreshIndicator(
                      onRefresh: () async {
                        setState(() {});
                      },
                      child: ScrollConfiguration(
                        behavior: NoGlow(),
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // START: hangman title
                                SizedBox(height: MediaQuery.of(context).size.height / 13),
                                const WidgetsHangmanTitle(),
                                // END: hangman title
                                // START: You won text
                                SizedBox(height: MediaQuery.of(context).size.height / 20),
                                Text(
                                  "You Lost",
                                  style: GoogleFonts.ubuntu(
                                    color: Colors.red,
                                    fontSize: MediaQuery.of(context).size.height / 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                // END: You won text
                                // START: The right answer was text
                                SizedBox(height: MediaQuery.of(context).size.height / 100),
                                Text(
                                  "The right answer was: ",
                                  style: GoogleFonts.ubuntu(
                                    color: Colors.red,
                                    fontSize: MediaQuery.of(context).size.height / 30,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                // END: The right answer was text
                                // START: Answer
                                SizedBox(height: MediaQuery.of(context).size.height / 100),
                                WidgetsAnswerWinLose(
                                  index: widget.index,
                                  color: Colors.red,
                                ),
                                // END: Answer
                                // START: Win animation
                                SizedBox(height: MediaQuery.of(context).size.height / 20),
                                Container(
                                  width: MediaQuery.of(context).size.height / 2.2,
                                  height: MediaQuery.of(context).size.height / 3.5,
                                  // decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                                  child: const RiveAnimation.asset(
                                    'assets/rive/lose.riv',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                // END: Win animation
                                // START: play or wait for admin
                                SizedBox(height: MediaQuery.of(context).size.height / 20),
                                WidgetsNextWait(start: snapshot.data!),
                                // END: play or wait for admin
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return SpinKitCircle(color: Colors.green[900]);
          }
        });
  }
}
