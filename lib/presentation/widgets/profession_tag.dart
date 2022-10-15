import 'package:flutter/material.dart';
import 'package:health_providers/constants.dart';

class ProfessionTag extends StatelessWidget {
  const ProfessionTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8
      ),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kButtonColor2,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Title",
            style: TextStyle(
              color: kButtonColor1,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            width: 4,
          ),
          GestureDetector(
            child: Icon(
              Icons.cancel,
              color: kButtonColor1,
            ),
          )
        ],
      ),
    );
  }
}
