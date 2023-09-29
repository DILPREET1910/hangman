import 'package:flutter/material.dart';

// lib imports
import 'package:hangman_ieee_intromeet_2023/widgets/hangmanTitle.dart';
import 'package:hangman_ieee_intromeet_2023/widgets/noGlow.dart';
import 'package:hangman_ieee_intromeet_2023/widgets/forHome/playOrWaiting.dart';
import 'package:hangman_ieee_intromeet_2023/services/firestore.dart';

// google fonts imports
import 'package:google_fonts/google_fonts.dart';

// spinkit imports
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // firestore instance
  Firestore firestore = Firestore();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firestore.startGame(),
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
                                SizedBox(height: MediaQuery.of(context).size.height / 7),
                                const WidgetsHangmanTitle(),
                                // END: hangman title
                                // START: sub title
                                SizedBox(height: MediaQuery.of(context).size.height / 50),
                                Text(
                                  "hang your self",
                                  style: GoogleFonts.ubuntu(
                                      color: Colors.white,
                                      fontSize: 20,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w300),
                                ),
                                // END: sub title
                                // START: play or wait for admin
                                SizedBox(height: MediaQuery.of(context).size.height / 2.7),
                                WidgetsPlayWait(start: snapshot.data!),
                                // END: play or wait for admin
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return SpinKitCircle(color: Colors.grey[900]);
          }
        });
  }
}
