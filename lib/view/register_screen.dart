import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validation/form_validation.dart';
import 'package:work_task/auth/auth_controller/controller.dart';
import 'package:work_task/controller/widget/text_widget.dart';
import 'package:work_task/controller/widget/texteditingwidget.dart';
import 'package:work_task/model/user_model.dart';
import 'package:work_task/navigator/navigation.dart';
import 'package:work_task/view/desigion_register_and_login_screen.dart';
import 'package:work_task/view/login_screen.dart';

import 'navigation_widget.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  // Firebase Auth
  FirebaseAuth auth = FirebaseAuth.instance;
  // TextEditingController
  TextEditingController firstNametextEditingController =
      TextEditingController();
  TextEditingController lastNametextEditingController = TextEditingController();
  TextEditingController gmailtextEditingController = TextEditingController();
  TextEditingController phoneNumbertextEditingController =
      TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();
  TextEditingController confirmPasswordtextEditingController =
      TextEditingController();
  // sdfasdf

  // Global Key .
  final formKey = GlobalKey<FormState>();
  saveUserDataToFirebase() {
    ref.read(authControllerProvide).saveUserInfoToFirestor(
        firstName: firstNametextEditingController.text,
        lastName: lastNametextEditingController.text,
        email: gmailtextEditingController.text,
        phoneNo: phoneNumbertextEditingController.text,
        userImages: 'NL',
        dateOfBirth: '1 jan 2023',
        gender: 'Male');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const DesigionScreen(titlename: 'Register an account'),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(name: 'First Name'),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormFieldWidget(
                      textEditingController: firstNametextEditingController,
                      hintText: 'Muhammad',
                      valiDator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter First Name';
                        }
                        final validator = Validator(
                          validators: [
                            const MinLengthValidator(length: 5),
                          ],
                        );

                        return validator.validate(
                          label: 'Required',
                          value: value,
                        );
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(name: 'Last Name'),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormFieldWidget(
                      textEditingController: lastNametextEditingController,
                      hintText: 'Sajjad',
                      valiDator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Last Name';
                        }
                        final validator = Validator(
                          validators: [
                            const MinLengthValidator(length: 5),
                          ],
                        );

                        return validator.validate(
                          label: 'Required',
                          value: value,
                        );
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(name: 'Email'),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormFieldWidget(
                      textEditingController: gmailtextEditingController,
                      hintText: 'Enter Your Email Address',
                      valiDator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Email';
                        }
                        final validator = Validator(
                          validators: [
                            const EmailValidator(),
                          ],
                        );

                        return validator.validate(
                          label: 'Required',
                          value: value,
                        );
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(name: 'Phone Number'),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormFieldWidget(
                      textEditingController: phoneNumbertextEditingController,
                      hintText: '03116227886',
                      valiDator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter A PhoneNo';
                        }
                        final validator = Validator(
                          validators: [
                            const PhoneNumberValidator(),
                            const MinLengthValidator(length: 11),
                            const MaxLengthValidator(length: 11)
                          ],
                        );

                        return validator.validate(
                          label: 'Required',
                          value: value,
                        );
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(name: 'Password'),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormFieldWidget(
                      textEditingController: passwordtextEditingController,
                      hintText: 'At least 8 characters',
                      valiDator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter A Password';
                        }
                        final validator = Validator(
                          validators: [
                            const MinLengthValidator(length: 8),
                            const MaxLengthValidator(length: 8)
                          ],
                        );

                        return validator.validate(
                          label: 'Required',
                          value: value,
                        );
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(name: 'Confirm Password'),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormFieldWidget(
                      textEditingController:
                          confirmPasswordtextEditingController,
                      hintText: 'Must match the Password',
                      valiDator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Correct A Password';
                        } else if (passwordtextEditingController.text !=
                            confirmPasswordtextEditingController.text) {
                          return "Not match password";
                        }
                        final validator = Validator(
                          validators: [
                            const MinLengthValidator(length: 8),
                            const MaxLengthValidator(length: 8)
                          ],
                        );

                        return validator.validate(
                          label: 'Required',
                          value: value,
                        );
                      },
                    )
                  ],
                ),
              ),

              //! Button Section .
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.red.shade700),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        createEmaiAndPassword(gmailtextEditingController.text,
                            passwordtextEditingController.text);
                        // saveUserDataToFirebase();
                      }
                    },
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(NavigationPage(child: const LoginScreen()));
                    },
                    child: RichText(
                        text: TextSpan(
                            text: 'Already have an account? ',
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400),
                            children: [
                          TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                  color: Colors.red.shade700,
                                  fontWeight: FontWeight.bold))
                        ])),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void createEmaiAndPassword(email, password) {
    auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      await userStoreData();
      Navigator.of(context).pushAndRemoveUntil(
          NavigationPage(child: const NavigationBarWidget()), (route) => false);
    });
  }

  Future<void> userStoreData() async {
    String time = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    UserModel userModel = UserModel();
    User? user = FirebaseAuth.instance.currentUser;
    userModel.id = user!.uid;
    userModel.email = user.email;
    userModel.firstName = firstNametextEditingController.text;
    userModel.lastName = lastNametextEditingController.text;
    userModel.phoneNo = phoneNumbertextEditingController.text;
    userModel.gender = "Male";
    userModel.dateOfBirth = "09/02/2023";

    firebaseFirestore
        .collection("users")
        .doc("${user.uid}$time")
        .set(userModel.toMap())
        .then((value) {
      print("Successfully");
    });
  }
}
