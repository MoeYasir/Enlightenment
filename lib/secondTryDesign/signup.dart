import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:health_providers/constants.dart';
import 'package:health_providers/presentation/pages/hospital_info.dart';
import 'package:health_providers/secondTryDesign/widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:health_providers/secondTryDesign/widgets.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class SignUp extends StatefulWidget {
  final title;
  SignUp({Key? key, this.title}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    Future showSuccess() {
      return EasyLoading.showSuccess('Account Created Succesfully');
    }

    Future showError(String errorMessage) {
      return EasyLoading.showError('Account Created Succesfully');
    }

    void doUserRegistration() async {
      final username = nameController.text.trim();
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      final user = ParseUser.createUser(username, password, email);

      var response = await user.signUp();

      if (response.success) {
        showSuccess();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HospitalInfo()));
      } else {
        showError(response.error!.message);
      }
    }

    return SafeArea(
      child: Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: const Color(0xDB4BE8CC),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      'Create\nAccount',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    child: inputField(
                      'Name',
                      nameController,
                      Ionicons.person_outline,
                      false,
                      (text) {
                        if (text == null || text.isEmpty) {
                          return 'Can\'t be empty';
                        }

                        return null;
                      },
                    ),
                  ),
                  Container(
                    height: 100,
                    child: inputField(
                        'Email', emailController, Ionicons.mail_outline, false,
                        (text) {
                      if (text == null || text.isEmpty) {
                        return 'Can\'t be empty';
                      }
                      return null;
                    }),
                  ),
                  Container(
                    height: 100,
                    child: inputField(
                      'Password',
                      passwordController,
                      Ionicons.lock_closed_outline,
                      true,
                      (text) {
                        if (text == null || text.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        if (text.length < 4) {
                          return 'Too short';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    height: 100,
                    child: inputField(
                      'Confirm Password',
                      confirmPasswordController,
                      Ionicons.lock_closed_outline,
                      true,
                      (text) {
                        if (text == null || text.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        if (text != passwordController.text) {
                          return 'Passwords don\'t match';
                        }
                        if (text.length < 4) {
                          return 'Too short';
                        }
                        return null;
                      },
                    ),
                  ),
                  // inputField('Address', Ionicons.location_outline, false),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 110, vertical: 16),
                    child: Container(
                      width: 400,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            doUserRegistration();
                          } else {
                            return null;
                          }
                        },
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
                    height: 10,
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
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (context) => LoginScreen3(
                                        title: widget.title,
                                      )));
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
      ),
    );
  }
}
