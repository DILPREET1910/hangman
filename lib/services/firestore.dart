// firebase imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Firestore {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  Future<void> incrementTeam(String team) async {
    try {
      print("trying");
      await firestoreInstance.collection("teamCount").doc(team).update({
        "count": FieldValue.increment(1),
      });
    } on FirebaseException catch (error) {
      print("Error while incrementing team: $error");
    }
  }
}
