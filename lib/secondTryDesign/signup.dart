import 'package:flutter/material.dart';
import 'package:health_providers/secondTryDesign/widgets.dart';
import 'package:ionicons/ionicons.dart';

import '../outside/utils/konstant.dart';
import 'login_screen.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xDB4BE8CC),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: const Text(
                    'Create\nAccount',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                inputField('Name', Ionicons.person_outline, false),
                inputField('Email', Ionicons.mail_outline, false),
                inputField('Password', Ionicons.lock_closed_outline, true),
                inputField(
                    'Confirm Password', Ionicons.lock_closed_outline, true),
                inputField('Address', Ionicons.location_outline, false),
                const SizedBox(
                  height: 30,
                ),
                loginButton('Sign Up'),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginScreen3()));
                      },
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          color: kSecondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
