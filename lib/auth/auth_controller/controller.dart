import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:work_task/auth/auth_repository/repositery.dart';

final authControllerProvide = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return Contoller(repositery: authRepository, ref: ref);
});

class Contoller {
  Repositery repositery;
  final ProviderRef ref;
  Contoller({required this.repositery, required this.ref});

   

  // save data firestore
  void saveUserInfoToFirestor({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNo,
    required String userImages,
    required String dateOfBirth,
    required String gender,
  }) {
    repositery.saveUserInfoToFirestor(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNo: phoneNo,
        userImages: userImages,
        dateOfBirth: dateOfBirth,
        gender: gender);
  }

  //sign
  void signInMethod(
      {required String email,
      required String password,
      required BuildContext context}) {
    repositery.signInWithEmailAndPassword(
        email: email, password: password, context: context);
  }

  //create
  void createEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) {
    repositery.createEmailAndPassword(
        email: email, password: password, context: context);
  }
}
