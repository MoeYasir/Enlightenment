import 'package:flutter/material.dart';
import 'package:health_providers/presentation/pages/login_page.dart';
import 'package:health_providers/presentation/pages/signup_page.dart';
import 'package:health_providers/presentation/widgets/button.dart';

class LogInSignUp extends StatelessWidget {
  final String name;
  const LogInSignUp({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Providers'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RoundedButton(
              btnText: 'Log In',
              onBtnPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LogInPage()));
              },
              ButtonColor: Color(0xff060D3F),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RoundedButton(
              btnText: 'Sign Up',
              onBtnPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              ButtonColor: Colors.blue[100],
            ),
          ),
        ],
      ),
    );
  }
}
