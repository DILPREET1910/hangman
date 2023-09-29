// firebase imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Firestore {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  // get Next Question status
  Future<bool> questionStatus(int questionNumber) async {
    DocumentSnapshot documentSnapshot =
        await firestoreInstance.collection("admin").doc("questions").get();
    bool nextQuestion = documentSnapshot.get(questionNumber.toString());
    return nextQuestion;
  }

  // increment team member count
  Future<void> incrementTeam(String team) async {
    try {
      print("trying");
      await firestoreInstance.collection("teamCount").doc(team).update({
        "count": FieldValue.increment(1),
        "score": FieldValue.increment(12000),
      });
    } on FirebaseException catch (error) {
      print("Error while incrementing team: $error");
    }
  }
}
