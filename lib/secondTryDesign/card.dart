import 'package:flutter/material.dart';

class TheCard extends StatelessWidget {
  const TheCard({
    required this.text,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 200,
        width: 100,
        child: Card(
          shadowColor: Colors.black,
          elevation: 2,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: const Color(0xB316BFC4),
                size: 40,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 20, color: Color(0xB316BFC4)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
