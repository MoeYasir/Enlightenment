import 'package:flutter/material.dart';
import 'package:health_providers/secondTryDesign/signup.dart';

class HomeGridTile extends StatelessWidget {
  final String icon;
  final String title;

  const HomeGridTile({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 300,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 70, width: 70, child: Image.asset(icon)),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 20, color: Color(0xB316BFC7)),
            )
          ],
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
