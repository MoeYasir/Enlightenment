import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:health_providers/constants.dart';
import 'package:health_providers/presentation/pages/page_redirection.dart';
import 'package:health_providers/secondTryDesign/signup.dart';
import 'package:health_providers/secondTryDesign/widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class LoginScreen3 extends StatefulWidget {
  final String title;
  const LoginScreen3({Key? key, required this.title}) : super(key: key);

  @override
  State<LoginScreen3> createState() => _LoginScreen3State();
}

class _LoginScreen3State extends State<LoginScreen3> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    Future showLoginError(String errorMessage) {
      return EasyLoading.showError(errorMessage);
    }

    dynamic doUserLogin() async {
      final email = username.text.trim();
      final password = passwordController.text.trim();

      final user = ParseUser(email, password, null);
      var response = await user.login();
      if (response.success) {
        EasyLoading.showSuccess("User was successfully logged In!");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PageChoice(
                      title: widget.title,
                    )));
      } else {
        showLoginError(response.error!.message);
      }
    }

    return SafeArea(
      child: Form(
        key: _formKey,
        child: Scaffold(
          // backgroundColor: const Color(0xDB4BE8CC),
          body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0x007CBFCF),
                  Color(0xB316BFC4),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome\nBack',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 100,
                      child: inputField(
                          'Name', username, Ionicons.person_outline, false,
                          (text) {
                        if (text == null || text.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        return null;
                      }),
                    ),
                    Container(
                      height: 100,
                      child: inputField('Password', passwordController,
                          Ionicons.lock_closed_outline, true, (text) {
                        if (text == null || text.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        return null;
                      }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 110, vertical: 16),
                      child: Container(
                        width: 400,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              doUserLogin();
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
                            'Log in',
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
                          'Don\'t have an account? ',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => SignUp(
                                          title: widget.title,
                                        )));
                          },
                          child: const Text(
                            'Sign Up',
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
      ),
    );
  }
}
