import 'package:flutter/material.dart';
import 'package:health_providers/presentation/widgets/staff_list_tile.dart';

class StaffPage extends StatefulWidget {
  StaffPage({Key? key}) : super(key: key);

  List<StaffListTile> staff = [];

  @override
  State<StaffPage> createState() => _StaffPageState();
}

class _StaffPageState extends State<StaffPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Staff"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: widget.staff.length,
          itemBuilder: (context, index) => StaffListTile(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add
        ),
        onPressed: () {
          setState(() {
            widget.staff.add(StaffListTile());
          });
        },
      ),
    );
  }
}
