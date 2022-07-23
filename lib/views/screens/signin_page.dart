import 'package:cycle_ai/constants.dart';
import 'package:cycle_ai/core/navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/rounded_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  late String email;

  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        title: const Center(
          child: Text('            Log In'),
        ),
        actions: [
          TextButton(
            onPressed: () => AppNavigator.navigateTo(registerRoute),
            child: const Text(
              'Sign Up',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Center(
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
                RoundedButton(
                  myColor: kMainPrimaryColor,
                  myText: 'Log in with Mail',
                  onPressed: () => AppNavigator.navigateTo(mailLogin),
                ),
                RoundedButton(
                    myColor: kMainPrimaryColor,
                    myText: 'Log in with Google',
                    onPressed: () => null),
                RoundedButton(
                    myColor: kMainPrimaryColor,
                    myText: 'Log in with FaceBook',
                    onPressed: () => null),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
