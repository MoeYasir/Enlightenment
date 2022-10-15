import 'package:flutter/material.dart';
import 'package:health_providers/constants.dart';
import 'package:health_providers/presentation/widgets/profession_drop_down_list.dart';
import 'package:health_providers/presentation/widgets/text_field.dart';

class StaffListTile extends StatelessWidget {
  const StaffListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>>? staff = [
      DropdownMenuItem(
        value: "Adminaaaaaaaaaaaaaaaaaaaaa",
        child: Text("Adminaaaaaaaaaaaaaaaaaaaaaaaa"),
      ),
      DropdownMenuItem(
        value: "Admin",
        child: Text("Admin"),
      ),
      DropdownMenuItem(
        value: "Admi",
        child: Text("Admin"),
      ),
      DropdownMenuItem(
        value: "Admina",
        child: Text("Admin"),
      )
    ];

    String? initialValue = "Admin";

    return Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: Colors.greenAccent
        ),
        child: Row(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.70,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyTextField(
                    pass: false,
                    hintText: "Enter",
                    controller: TextEditingController(),
                    inputType: TextInputType.name,
                  ),
                )),
            SizedBox(
              width: 80,
              height: 50,
              child: ProfessionDropDownList(
                initialValue: initialValue,
                staff: staff,
              ),
            ),
          ],
        ));
  }
}
