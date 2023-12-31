import 'package:flutter/material.dart';

// lib imports
import 'package:hangman_ieee_intromeet_2023/services/firestore.dart';
import 'package:hangman_ieee_intromeet_2023/pages/leaderboard.dart';
import 'package:hangman_ieee_intromeet_2023/widgets/hangmanTitle.dart';
import 'package:hangman_ieee_intromeet_2023/widgets/noGlow.dart';
import 'package:hangman_ieee_intromeet_2023/widgets/forWinLose/nextOrWaiting.dart';
import 'package:hangman_ieee_intromeet_2023/widgets/forWinLose/answer.dart';

// google fonts imports
import 'package:google_fonts/google_fonts.dart';

// spinkit imports
import 'package:flutter_spinkit/flutter_spinkit.dart';

// rive imports
import 'package:rive/rive.dart';

class Win extends StatefulWidget {
  final int index;

  const Win({super.key, required this.index});

  @override
  State<Win> createState() => _WinState();
}

class _WinState extends State<Win> {
  // firestore instance
  Firestore firestore = Firestore();

  @override
  Widget build(BuildContext context) {
    if (widget.index < 11) {
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
                                  "You Won",
                                  style: GoogleFonts.ubuntu(
                                    color: Colors.green,
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
                                    color: Colors.green,
                                    fontSize: MediaQuery.of(context).size.height / 30,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                // END: The right answer was text
                                // START: Answer
                                SizedBox(height: MediaQuery.of(context).size.height / 100),
                                WidgetsAnswerWinLose(
                                  index: widget.index,
                                  color: Colors.green,
                                ),
                                // END: Answer
                                // START: Win animation
                                SizedBox(height: MediaQuery.of(context).size.height / 20),
                                Container(
                                  width: MediaQuery.of(context).size.height / 2.2,
                                  height: MediaQuery.of(context).size.height / 3.5,
                                  // decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                                  child: const RiveAnimation.asset(
                                    'assets/rive/win.riv',
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
            return SpinKitCircle(color: Colors.grey[900]);
          }
        },
      );
    } else {
      return const LeaderBoard();
    }
  }
}
