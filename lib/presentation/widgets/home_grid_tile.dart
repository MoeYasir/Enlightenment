import 'package:flutter/material.dart';
import 'package:health_providers/secondTryDesign/signup.dart';

import '../../constants.dart';

class HomeGridTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const HomeGridTile({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kButtonColor1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.add_circle), Text(title)],
                  ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => SignUp(title: title)),
        );
      },
    );
  }
}
