import 'package:cycle_ai/core/navigator.dart';

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../../common/firebase_enums.dart';
import '../../constants.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  late String email;

  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        title: const Center(
          child: Text('Create Account'),
        ),
        actions: const [],
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 120),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'CYCLE AI',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: kMainPrimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Create your account',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: kMainPrimaryColor),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Email'),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        //controller: emailController,
                        onChanged: (value) {
                          email = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: kMainPrimaryColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: kMainPrimaryColor),
                          ),
                          hintText: 'Enter your email',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('Password'),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (value) {
                          password = value;
                        },
                        controller: passwordController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: kMainPrimaryColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: kMainPrimaryColor),
                          ),
                          hintText: 'Enter your Password',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('Confirm Password'),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: passwordController2,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: kMainPrimaryColor),
                          ),
                          hintText: 'Confirm Password',
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () async {
                        try {
                          if (passwordController.text !=
                              passwordController2.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('PassWords don\'t match'),
                              ),
                            );
                          } else {
                            final newUser =
                                await auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            // ignore: unnecessary_null_comparison
                            if (newUser != null) {
                              AppNavigator.navigateToAndReplace(mainPage);
                            }
                          }
                        } on FirebaseAuthException catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(determineError(e).toString()),
                            ),
                          );
                          setState(() {});
                        }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: kMainPrimaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Create Account and Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

AuthError determineError(FirebaseAuthException exception) {
  switch (exception.code) {
    case 'invalid-email':
      return AuthError.invalidEmail;
    case 'user-disabled':
      return AuthError.userDisabled;
    case 'user-not-found':
      return AuthError.userNotFound;
    case 'wrong-password':
      return AuthError.wrongPassword;
    case 'email-already-in-use':
    case 'account-exists-with-different-credential':
      return AuthError.emailAlreadyInUse;
    case 'invalid-credential':
      return AuthError.invalidCredential;
    case 'operation-not-allowed':
      return AuthError.operationNotAllowed;
    case 'weak-password':
      return AuthError.weakPassword;
    case 'ERROR_MISSING_GOOGLE_AUTH_TOKEN':
    default:
      return AuthError.error;
  }
}
