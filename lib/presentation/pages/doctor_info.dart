import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:health_providers/constants.dart';
import 'package:health_providers/presentation/pages/information_compelte.dart';
import 'package:health_providers/presentation/widgets/button.dart';
import 'package:health_providers/presentation/widgets/text_field.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class DoctorInfo extends StatefulWidget {
  const DoctorInfo({Key? key}) : super(key: key);

  @override
  State<DoctorInfo> createState() => _DoctorInfoState();
}

class _DoctorInfoState extends State<DoctorInfo> {
  TextEditingController DoctorAddress = TextEditingController();
  TextEditingController DoctorPhoneNumber = TextEditingController();
  TextEditingController DoctorLocation = TextEditingController();
  TextEditingController DoctorWebsite = TextEditingController();

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
                controller: DoctorAddress,
                hintText: 'Enter your address',
                pass: false,
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 5,
              ),
              MyTextField(
                controller: DoctorPhoneNumber,
                hintText: 'Enter your main phone number',
                pass: false,
              ),
              SizedBox(
                height: 5,
              ),
              MyTextField(
                controller: DoctorWebsite,
                hintText: 'Enter your website',
                pass: false,
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                child: Container(
                  child: Text('Save'),
                ),
                onTap: uploadPharmacyInfo,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> uploadPharmacyInfo() async {
    var action = ParseObject('DoctorDetails')
      ..set('address', DoctorAddress.text.trim())
      ..set('phone_number', DoctorPhoneNumber.text.trim())
      ..set('doctorWebsite', DoctorWebsite.text.trim());
    EasyLoading.show(status: 'Saving...', maskType: EasyLoadingMaskType.clear);
    await action.save();
    EasyLoading.showSuccess('Success');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => InformationCompleted()));
  }
}
