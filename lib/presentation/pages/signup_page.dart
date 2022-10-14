import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:health_providers/constants.dart';
import 'package:health_providers/data/hospital.dart';
import 'package:health_providers/presentation/pages/hospital_info.dart';
import 'package:health_providers/presentation/widgets/button.dart';
import 'package:health_providers/presentation/widgets/text_field.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class SignUpPage extends StatefulWidget {
  final String title;
  const SignUpPage({Key? key, required this.title}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

    void showLoginSuccess(String message) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Success!"),
            content: Text(message),
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

    void showLoginError(String errorMessage) {
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

    void doUserLogin() async {
      bool isLoggedIn;
      final username = nameController.text.trim();
      final password = passwordController.text.trim();

      final user = ParseUser(username, password, null);
      var response = await user.login();
      if (response.success) {
//        showLoginSuccess("User was successfully login!");btn
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HospitalInfo()));

        setState(() {
          isLoggedIn = true;
        });
      } else {
        showLoginError(response.error!.message);
      }
    }

    // TextEditingController passwordController = TextEditingController();
    // TextEditingController passwordController = TextEditingController();
    // TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Sign Up page'),
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
                    child: MyTextField(
                        pass: false,
                        textFieldIcon: Icon(Icons.email),
                        inputType: TextInputType.emailAddress,
                        controller: nameController,
                        hintText: 'Enter your ${widget.title} name'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
                    child: MyTextField(
                        pass: false,
                        textFieldIcon: Icon(Icons.email),
                        inputType: TextInputType.emailAddress,
                        controller: emailController,
                        hintText: 'Enter your ${widget.title} email'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
                    child: MyTextField(
                        textFieldIcon: Icon(Icons.password),
                        pass: true,
                        controller: passwordController,
                        hintText: 'Enter your password'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
                    child: MyTextField(
                      textFieldIcon: Icon(Icons.password),
                      pass: true,
                      controller: confirmPasswordController,
                      hintText: 'Confirm your password',
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Can\'t be empty';
                        }

                        if (text != passwordController.text) {
                          return 'Passowrds don\'t match';
                        }
                        if (text.length < 4) {
                          return 'Too short';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
                    child: RoundedButton(
                      btnText: 'Sign Up',
                      onBtnPressed: () {
                        if (_formKey.currentState!.validate()) {
                          doUserRegistration();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HospitalInfo()));
                        } else {
                          EasyLoading.showError('Account was not created');
                        }
                      },
                      ButtonColor: kButtonColor2,
                    ),
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
