// firebase imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
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

  // decrement for wrong alphabet selected
  Future<void> decrement(String team) async {
    try {
      await firestoreInstance.collection("teamCount").doc(team).update({
        "score": FieldValue.increment(-200),
      });
    } on FirebaseException catch (error) {
      print("Error while decrementing score: $error");
    }
  }

  // get score
  Future<List<int>> leaderboardScore() async {
    List<int> result = [];
    try {
      for (int i = 1; i < 5; i++) {
        DocumentSnapshot snapshot =
            await firestoreInstance.collection("teamCount").doc("audi $i").get();
        int count = snapshot.get("count");
        int score = snapshot.get("score");
        if (count != 0 && score != 0) {
          result.add((score / count).round());
        } else {
          result.add(0);
        }
      }
    } on FirebaseException catch (error) {
      print("Error while calculating leader board score: $error");
    }
    return result;
  }
}
