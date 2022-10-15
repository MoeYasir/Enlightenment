import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:health_providers/constants.dart';
import 'package:health_providers/presentation/pages/information_compelte.dart';
import 'package:health_providers/presentation/widgets/button.dart';
import 'package:health_providers/presentation/widgets/text_field.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class PharmacyInfo extends StatefulWidget {
  const PharmacyInfo({Key? key}) : super(key: key);

  @override
  State<PharmacyInfo> createState() => _PharmacyInfoState();
}

class _PharmacyInfoState extends State<PharmacyInfo> {
  TextEditingController PharmacyAdress = TextEditingController();
  TextEditingController PharmacyPhoneNumber = TextEditingController();
  TextEditingController PharmacyLocation = TextEditingController();
  TextEditingController PharmacyWebsite = TextEditingController();

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
                controller: PharmacyAdress,
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
                controller: PharmacyPhoneNumber,
                hintText: 'Enter your pharmacy\'s main phone number',
                pass: false,
              ),
              SizedBox(
                height: 5,
              ),
              MyTextField(
                controller: PharmacyWebsite,
                hintText: 'Enter your pharmacy\'s website',
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
    var action = ParseObject('PharmacyDetails')
      ..set('adress', PharmacyAdress.text.trim())
      ..set('phone_number', PharmacyPhoneNumber.text.trim())
      ..set('pharmacyWebsite', PharmacyWebsite.text.trim());
    EasyLoading.show(status: 'Saving...', maskType: EasyLoadingMaskType.clear);
    await action.save();
    EasyLoading.showSuccess('Success');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => InformationCompleted()));
  }
}
