import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String? uid;

  DatabaseService({this.uid});
//reference for our collections

final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");

final CollectionReference groupCollection = FirebaseFirestore.instance.collection("groups");

Future updateUserData(String fullname, String email)async{
  return await userCollection.doc(uid).set({
    "fullname": fullname,
    "email"  : email,
    "group": [],
    "profilePic": '',
    "uid": uid,

  });

}



}