import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  void addUser(String user, String email, String pass)async{
    try {
      await _firestore.collection("Users")
        .doc(_auth.currentUser!.uid)
        .set({
          "user":user,
          "email": email,
          "pass":pass,
          "travelPlans":[]
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  void addTravelPlan(String location, String destination, String start, String end, String budget, String people, String travel_plan)async{
    try {
      await _firestore.collection("Users")
        .doc(_auth.currentUser!.uid)
        .update({
          "travelPlans":FieldValue.arrayUnion([{
            "travel_plan":travel_plan,
            "location":location,
            "destination":destination,
            "start":start,
            "end":end,
            "budget":budget,
            "people":people,
          }])
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  void getTravelPlanLength;

  Stream<DocumentSnapshot<Map<String, dynamic>>> getTravelPlans(){
    final planStream = _firestore.collection("Users").doc(_auth.currentUser!.uid).snapshots();
    return planStream;
  }

  void deleteTravelPlan(String location, String destination, String start, String end, String budget, String people, String travel_plan)async{
    try {
      await _firestore.collection("Users")
        .doc(_auth.currentUser!.uid)
        .update({
          "travelPlans":FieldValue.arrayRemove([{
            "travel_plan":travel_plan,
            "location":location,
            "destination":destination,
            "start":start,
            "end":end,
            "budget":budget,
            "people":people,
          }])
      });
    } on Exception catch (e) {
      print(e);
    }
  }
}