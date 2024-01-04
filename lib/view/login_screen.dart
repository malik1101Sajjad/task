import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validation/form_validation.dart';
import 'package:work_task/auth/auth_controller/controller.dart';
import 'package:work_task/controller/widget/text_widget.dart';
import 'package:work_task/controller/widget/texteditingwidget.dart';
import 'package:work_task/navigator/navigation.dart';
import 'package:work_task/view/desigion_register_and_login_screen.dart';
import 'package:work_task/view/register_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController gmailtextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  void loginFunction() {
    ref.read(authControllerProvide).signInMethod(
        email: gmailtextEditingController.text.trimLeft(),
        context: context,
        password: passwordtextEditingController.text.trimLeft());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              //desigion widget
              const DesigionScreen(titlename: 'Login to your Account'),
              //gmail text form field
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
                      hintText: 'abc@gmail.com',
                      valiDator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Correct Email';
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
              //password text form field
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(name: 'password'),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormFieldWidget(
                      textEditingController: passwordtextEditingController,
                      hintText: 'password',
                      valiDator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Password';
                        }
                        final validator = Validator(
                          validators: [
                            const MinLengthValidator(length: 8),
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
              //check box and forget password
              ListTile(
                leading: Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.red.shade700,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                  value: true,
                  onChanged: (value) {},
                ),
                title: const Text(
                  'Remember me',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                trailing: const Text(
                  'Forgot password?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
              // login elevated buttion
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.red.shade700),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {
                      loginFunction();
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              ),
              // go to register account
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(NavigationPage(child: const RegisterScreen()));
                    },
                    child: RichText(
                        text: TextSpan(
                            text: 'Dont have an account? ',
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400),
                            children: [
                          TextSpan(
                              text: 'Register',
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
}
