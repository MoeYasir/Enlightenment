import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:health_providers/constants.dart';
import 'package:health_providers/presentation/pages/information_compelte.dart';
import 'package:health_providers/presentation/widgets/button.dart';
import 'package:health_providers/presentation/widgets/text_field.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AmbulanceInfo extends StatefulWidget {
  const AmbulanceInfo({Key? key}) : super(key: key);

  @override
  State<AmbulanceInfo> createState() => _AmbulanceInfoState();
}

class _AmbulanceInfoState extends State<AmbulanceInfo> {
  TextEditingController AmbulanceAdress = TextEditingController();
  TextEditingController AmbulancePhoneNumber = TextEditingController();
  TextEditingController AmbulanceLocation = TextEditingController();
  TextEditingController AmbulanceWebsite = TextEditingController();

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
                controller: AmbulanceAdress,
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
                controller: AmbulancePhoneNumber,
                hintText: 'Enter your ambulance\'s main phone number',
                pass: false,
              ),
              SizedBox(
                height: 5,
              ),
              MyTextField(
                controller: AmbulanceWebsite,
                hintText: 'Enter your ambulance\'s website',
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
                onTap: () {
                  uploadPharmacyInfo;
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> uploadPharmacyInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString('userId');

    var action = ParseObject('AmbulanceDetails')
      ..set('userId', prefs.getString('userId'))
      ..set('address', AmbulanceAdress.text.trim())
      ..set('phone_number', AmbulancePhoneNumber.text.trim())
      ..set('ambulanceWebsite', AmbulanceWebsite.text.trim());

    EasyLoading.show(status: 'Saving...', maskType: EasyLoadingMaskType.clear);
    await action.save();

    EasyLoading.showSuccess('Success');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => InformationCompleted()));
  }
}
