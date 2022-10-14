import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:health_providers/constants.dart';
import 'package:health_providers/presentation/pages/information_compelte.dart';
import 'package:health_providers/presentation/widgets/button.dart';
import 'package:health_providers/presentation/widgets/text_field.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class HospitalInfo extends StatefulWidget {
  const HospitalInfo({Key? key}) : super(key: key);

  @override
  State<HospitalInfo> createState() => _HospitalInfoState();
}

class _HospitalInfoState extends State<HospitalInfo> {
  TextEditingController HospitalAdress = TextEditingController();
  TextEditingController HospitalStaff = TextEditingController();
  TextEditingController HospitalPhoneNumber = TextEditingController();
  TextEditingController HospitalLocation = TextEditingController();
  TextEditingController HospitalWebsite = TextEditingController();
  bool isERavailable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('General Informtion'),
        backgroundColor: kButtonColor1,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextField(
                controller: HospitalAdress,
                hintText: 'Enter your adress',
                pass: false,
              ),
              SizedBox(
                height: 5,
              ),
              MyTextField(
                controller: HospitalStaff,
                hintText: 'Enter the number of your staff',
                pass: false,
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 5,
              ),
              MyTextField(
                controller: HospitalPhoneNumber,
                hintText: 'Enter your hostpital\'s main phone number',
                pass: false,
              ),
              SizedBox(
                height: 5,
              ),
              MyTextField(
                controller: HospitalWebsite,
                hintText: 'Enter your hostpital\'s website',
                pass: false,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'ER Available ?',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Checkbox(
                      value: isERavailable,
                      onChanged: (value) {
                        setState(() {
                          isERavailable = value!;
                          print(isERavailable);
                        });
                      }),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                child: Container(
                  child: Text('Save'),
                ),
                onTap: apploadHospitalInfo,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> apploadHospitalInfo() async {
    var action = ParseObject('HospitalDetails')
      ..set('adress', HospitalAdress.text.trim())
      ..set('phone_number', HospitalPhoneNumber.text.trim())
      ..set('isERavailable', isERavailable)
      ..set('hospitalWebsite', HospitalWebsite.text.trim())
      ..set('hospitalStaff', HospitalStaff.text.trim());

    await action.save();
    EasyLoading.dismiss();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => InformationCompleted()));
  }
}
