import 'package:flutter/material.dart';
import 'package:health_providers/constants.dart';
import 'package:health_providers/presentation/widgets/button.dart';
import 'package:health_providers/presentation/widgets/text_field.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Log In page'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyTextField(
                    pass: false,
                    textFieldIcon: Icon(Icons.email),
                    inputType: TextInputType.emailAddress,
                    controller: emailController,
                    hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyTextField(
                    textFieldIcon: Icon(Icons.password),
                    pass: true,
                    controller: passwordController,
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedButton(
                  btnText: 'Continue',
                  onBtnPressed: () {},
                  ButtonColor: kButtonColor1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
