import 'package:flutter/material.dart';
import 'package:health_providers/secondTryDesign/card.dart';
import 'package:ionicons/ionicons.dart';

import 'signup.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0x007CBFCF),
                Color(0xB316BFC4),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Text(
                  "What'\s your \n enrollment ? ",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: TheCard(
                      text: 'Hospital',
                      icon: Icons.local_hospital_outlined,
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: InkWell(
                      child: TheCard(
                        text: 'Pharmacy',
                        icon: Icons.search_outlined,
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                    ),
                  ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: TheCard(
                      text: 'Ambulance',
                      icon: Icons.search,
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: TheCard(
                      text: 'Doctor',
                      icon: Ionicons.alarm,
                    ),
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
