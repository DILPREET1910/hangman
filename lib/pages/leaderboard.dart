import 'package:flutter/material.dart';

// lib imports
import 'package:hangman_ieee_intromeet_2023/services/firestore.dart';

// google fonts import
import 'package:google_fonts/google_fonts.dart';

// spinkit imports
import 'package:flutter_spinkit/flutter_spinkit.dart';

// percentage indicator
import 'package:percent_indicator/linear_percent_indicator.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  // firestore instance
  Firestore firestore = Firestore();

  @override
  Widget build(BuildContext context) {
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
        FutureBuilder(
          future: firestore.leaderboardScore(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SafeArea(
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // START: Leader board title
                        Text(
                          "LeaderBoard",
                          style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height / 13,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                        // END: Leader board title
                        // START: score
                        SizedBox(height: MediaQuery.of(context).size.height / 10),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: MediaQuery.of(context).size.height / 50),
                                  Row(
                                    children: [
                                      SizedBox(width: MediaQuery.of(context).size.width / 30),
                                      Text(
                                        "Audi ${index + 1}",
                                        style: GoogleFonts.ubuntu(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context).size.height / 35,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height / 100),
                                  LinearPercentIndicator(
                                    animation: true,
                                    animationDuration: 1000,
                                    lineHeight: MediaQuery.of(context).size.height / 30,
                                    percent: snapshot.data![index] / 12000,
                                    center: Text(
                                      (snapshot.data![index] / 12000 * 1000).round().toString(),
                                      style: GoogleFonts.ubuntu(
                                        fontSize: MediaQuery.of(context).size.height / 38,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    barRadius: const Radius.circular(12),
                                    progressColor: Colors.green,
                                    backgroundColor: Colors.white,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        // END: score
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return SpinKitCircle(color: Colors.blue);
            }
          },
        ),
      ],
    );
  }
}
