import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:health_providers/constants.dart';
import 'package:health_providers/presentation/pages/hospital_info.dart';
import 'package:health_providers/secondTryDesign/widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class LoginScreen3 extends StatelessWidget {
  const LoginScreen3({Key? key}) : super(key: key);

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
            context, MaterialPageRoute(builder: (context) => HospitalInfo()));
      } else {
        showLoginError(response.error!.message);
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xDB4BE8CC),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 100),
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
                inputField('Name', username, Ionicons.person_outline, false),
                inputField('Password', passwordController,
                    Ionicons.lock_closed_outline, true),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 110, vertical: 16),
                  child: Container(
                    width: 400,
                    child: ElevatedButton(
                      onPressed: doUserLogin,
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
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
