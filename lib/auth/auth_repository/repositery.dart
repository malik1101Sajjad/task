// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:work_task/model/user_model.dart';
import 'package:work_task/navigator/navigation.dart';
import 'package:work_task/view/navigation_widget.dart';

final authRepositoryProvider = Provider((ref) {
  return Repositery(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  );
});

class Repositery {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  Repositery({required this.auth, required this.firestore});
  // save data firestore
  void saveUserInfoToFirestor({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNo,
    required String userImages,
    required String dateOfBirth,
    required String gender,
  }) async {
    try {
      String uid = auth.currentUser!.uid;
      UserModel userModel = UserModel(
          firstName: firstName,
          lastName: lastName,
          email: email,
          phoneNo: phoneNo,
          userImages: userImages,
          dateOfBirth: dateOfBirth,
          gender: gender);
      await firestore.collection('users').doc(uid).set(userModel.toMap());
    } catch (e) {
      print(e.toString());
    }
  }

  //sign
  void signInWithEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) {
    try {
      auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        Navigator.of(context).pushAndRemoveUntil(
            NavigationPage(child: NavigationBarWidget()), (route) => false);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  // create
  void createEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) {
    try {
      auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.of(context).pushAndRemoveUntil(
            NavigationPage(child: const NavigationBarWidget()),
            (route) => false);
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
