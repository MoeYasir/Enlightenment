import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:health_providers/constants.dart';
import 'package:health_providers/presentation/pages/information_compelte.dart';
import 'package:health_providers/presentation/widgets/button.dart';
import 'package:health_providers/presentation/widgets/text_field.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PharmacyInfo extends StatefulWidget {
  const PharmacyInfo({Key? key}) : super(key: key);

  @override
  State<PharmacyInfo> createState() => _PharmacyInfoState();
}

class _PharmacyInfoState extends State<PharmacyInfo> {
  // TODO: implement initState

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController pharmacyAdress = TextEditingController();
  TextEditingController pharmacyStaff = TextEditingController();
  TextEditingController pharmacyDrugs = TextEditingController();
  TextEditingController pharmacyPhoneNumber = TextEditingController();
  TextEditingController pharmacyLocation = TextEditingController();
  TextEditingController pharmacyWebsite = TextEditingController();
  bool is24open = false;
  int? location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'General Informtion',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        backgroundColor: kButtonColor1,
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello,\nWe need some information to submit you with us. .',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                MyTextField(
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Can\'t be empty';
                    }

                    return null;
                  },
                  controller: pharmacyAdress,
                  hintText: 'Enter your adress',
                  pass: false,
                ),
                MyTextField(
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Can\'t be empty';
                    }

                    return null;
                  },
                  controller: pharmacyLocation,
                  hintText: 'Enter your pharmacy\'s location',
                  pass: false,
                ),
                SizedBox(
                  height: 5,
                ),
                MyTextField(
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Can\'t be empty';
                    }
                    return null;
                  },
                  controller: pharmacyDrugs,
                  hintText: 'Enter the number of drugs',
                  pass: false,
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 5,
                ),
                MyTextField(
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Can\'t be empty';
                    }

                    if (text.length < 4) {
                      return 'Too short';
                    }
                    return null;
                  },
                  controller: pharmacyPhoneNumber,
                  hintText: 'Enter your hostpital\'s main phone number',
                  pass: false,
                ),
                SizedBox(
                  height: 5,
                ),
                MyTextField(
                  controller: pharmacyWebsite,
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
                      '24 hours/day Available ?',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 20),
                    ),
                    Checkbox(
                        value: is24open,
                        onChanged: (value) {
                          setState(() {
                            is24open = value!;
                            print(is24open);
                          });
                        }),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                    child: Container(
                      width: 200,
                      height: 30,
                      decoration: BoxDecoration(
                        color: kButtonColor1,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Save',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        location = int.parse(pharmacyLocation.text);
                        apploadPharmacyInfo();
                      } else {
                        return;
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> apploadPharmacyInfo() async {
    var action = ParseObject('PharmacyDetails')
      ..set('adress', pharmacyAdress.text.trim())
      ..set('phone_number', pharmacyPhoneNumber.text.trim())
      ..set('is24open', is24open)
      ..set('location', location)
      ..set('website', pharmacyWebsite.text.trim())
      ..set('pharmacyDrugs', pharmacyDrugs.text.trim());
    EasyLoading.show(status: 'Saving...', maskType: EasyLoadingMaskType.clear);
    var res = await action.save();
    if (res.success) {
      EasyLoading.showSuccess('Success');
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => InformationCompleted()));
    } else {
      EasyLoading.showError('network error try again');
    }
  }
}
