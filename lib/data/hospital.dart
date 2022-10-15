import 'package:flutter/material.dart';
import 'package:health_providers/presentation/pages/hospital_info.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Hospital {
  final String username;
  final String email;
  final String password;
  final BuildContext context;
  Hospital(this.username, this.email, this.password, this.context);
  void doUserRegistration() async {
    final user = ParseUser.createUser(username, password, email);

    var response = await user.signUp();
    if (response.success) {
      showSuccess();
    } else {
      showError(response.error!.message);
    }
  }

  void showSuccess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: const Text("Your account is successfully created!"),
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
    final user = ParseUser(username, password, null);
    var response = await user.login();
    if (response.success) {
      showLoginSuccess("successfully loged in!");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HospitalInfo()));
    } else {
      showLoginError(response.error!.message);
    }
  }
}
