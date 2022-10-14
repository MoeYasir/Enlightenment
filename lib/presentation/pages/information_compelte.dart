import 'package:flutter/material.dart';

class InformationCompleted extends StatefulWidget {
  const InformationCompleted({Key? key}) : super(key: key);

  @override
  State<InformationCompleted> createState() => _InformationCompletedState();
}

class _InformationCompletedState extends State<InformationCompleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: NetworkImage(
                'https://raw.githubusercontent.com/TheTechDesigner/E-Commerce/main/assets/images/success.gif'),
            // image: AssetImage('icons/avatar1.png'),
            height: 200.0,
          ),
          Text(
            'Your information has been submitted succesfully !!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
