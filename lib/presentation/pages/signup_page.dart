import 'package:flutter/material.dart';
import 'package:health_providers/constants.dart';
import 'package:health_providers/presentation/widgets/button.dart';
import 'package:health_providers/presentation/widgets/text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Sign Up page'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 5,
              ),
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
                  btnText: 'Sign Up',
                  onBtnPressed: () {},
                  ButtonColor: kButtonColor2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
