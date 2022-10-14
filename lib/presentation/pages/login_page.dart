import 'package:flutter/material.dart';
import 'package:health_providers/constants.dart';
import 'package:health_providers/presentation/pages/hospital_info.dart';
import 'package:health_providers/presentation/widgets/button.dart';
import 'package:health_providers/presentation/widgets/text_field.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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

    dynamic doUserLogin() async {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      final user = ParseUser(email, password, null);
      var response = await user.login();
      if (response.success) {
//        showLoginSuccess("User was successfully login!");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HospitalInfo()));
      } else {
        showLoginError(response.error!.message);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Log In page'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
                  child: MyTextField(
                      pass: false,
                      textFieldIcon: Icon(Icons.email),
                      inputType: TextInputType.emailAddress,
                      controller: emailController,
                      hintText: 'Enter your email'),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
                  child: MyTextField(
                      textFieldIcon: Icon(Icons.password),
                      pass: true,
                      controller: passwordController,
                      hintText: 'Enter your password'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
                  child: RoundedButton(
                    btnText: 'Continue',
                    onBtnPressed: () {
                      doUserLogin();
                    },
                    ButtonColor: kButtonColor1,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
