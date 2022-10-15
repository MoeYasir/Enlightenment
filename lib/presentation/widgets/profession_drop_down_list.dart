import 'package:flutter/material.dart';

class ProfessionDropDownList extends StatefulWidget {
  String? initialValue;
  List<DropdownMenuItem<String>> staff;

  ProfessionDropDownList({Key? key, this.initialValue, required this.staff}) : super(key: key);

  @override
  State<ProfessionDropDownList> createState() => _ProfessionDropDownListState();
}

class _ProfessionDropDownListState extends State<ProfessionDropDownList> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isExpanded: true,
        value: widget.initialValue,
        hint: Text(""),
        items: widget.staff,
        onChanged: (value) {
          setState(() {
            widget.initialValue = value;
          });
        },
      ),
    );
  }
}
