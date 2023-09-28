import 'lose.dart';
import 'package:flutter/material.dart';

// lib imports
import 'package:hangman_ieee_intromeet_2023/globalVariables.dart' as global;
import 'package:hangman_ieee_intromeet_2023/pages/home.dart';
import 'package:hangman_ieee_intromeet_2023/widgets/hangmanTitle.dart';
import 'package:hangman_ieee_intromeet_2023/widgets/textFormField.dart';
import 'package:hangman_ieee_intromeet_2023/widgets/forAuth/dropDown.dart';
import 'package:hangman_ieee_intromeet_2023/services/firestore.dart';

// spin kit imports
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  // firebase real time database instance
  Firestore firestore = Firestore();

  // name TextField controller
  TextEditingController nameTextEditingController = TextEditingController();

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
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // START: hangman title
                  const WidgetsHangmanTitle(),
                  // END: hangman title
                  // START: name text form field
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  WidgetsTextFormFields(
                      label: "Name",
                      icon: const Icon(Icons.label),
                      controller: nameTextEditingController),
                  // END: name text form field
                  // START: Team drop down
                  SizedBox(height: MediaQuery.of(context).size.height / 80),
                  const WidgetsTeamDropDown(),
                  // END: Team drop down
                  // START: register button
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  GestureDetector(
                      onTap: () async {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          return FutureBuilder(
                              future: firestore.incrementTeam(global.team),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.done) {
                                  return Lose(index: 2);
                                } else {
                                  return SpinKitCircle(color: Colors.grey[900]);
                                }
                              });
                        }));
                      },
                      child: Image.asset('assets/buttons/register.png'))
                  // END: register button
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
