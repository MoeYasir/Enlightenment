import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:health_providers/presentation/pages/home.dart';

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
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Container(
              width: 200,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Done',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
