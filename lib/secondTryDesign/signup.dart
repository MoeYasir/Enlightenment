import 'package:flutter/material.dart';
import 'package:health_providers/constants.dart';
import 'package:health_providers/secondTryDesign/widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:health_providers/secondTryDesign/widgets.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'login_screen.dart';

class SignUp extends StatelessWidget {
  final title;
  SignUp({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    void showSuccess() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Success!"),
            content: const Text("User was successfully created!"),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    void showError(String errorMessage) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error!"),
            content: Text(errorMessage),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    void doUserRegistration() async {
      final username = nameController.text.trim();
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      final user = ParseUser.createUser(username, password, email);

      var response = await user.signUp();

      if (response.success) {
        showSuccess();
      } else {
        showError(response.error!.message);
      }
    }

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
                inputField(
                    'Name', nameController, Ionicons.person_outline, false),
                inputField(
                    'Email', emailController, Ionicons.mail_outline, false),
                inputField('Password', passwordController,
                    Ionicons.lock_closed_outline, true),
                inputField('Confirm Password', confirmPasswordController,
                    Ionicons.lock_closed_outline, true),
                // inputField('Address', Ionicons.location_outline, false),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 110, vertical: 16),
                  child: Container(
                    width: 400,
                    child: ElevatedButton(
                      onPressed: doUserRegistration,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: const StadiumBorder(),
                        primary: kSecondaryColor,
                        elevation: 8,
                        shadowColor: Colors.black87,
                      ),
                      child: Text(
                        'Sign Up',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
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
