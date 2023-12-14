import 'package:flutter/material.dart';
import 'package:chat_app/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth firebaseAuth =FirebaseAuth.instance;

  //login

//register

Future registerUserwithEmailandPassword(String fullname, String email, String password,)async{
  try{
    User user =
    (await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user!;

    if (user!= null){
      //return true;
      DatabaseService(uid: user.uid).updateUserData(fullname, email);

    }
  } on FirebaseAuthException  catch(e){
    print(e.toString());
  }
}

//signout
}