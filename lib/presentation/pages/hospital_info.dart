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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello ,\nWe need some information to submit you with us. .',
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
                controller: HospitalAdress,
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
                controller: HospitalLocation,
                hintText: 'Enter your location',
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
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Can\'t be empty';
                  }

                  if (text.length < 4) {
                    return 'Too short';
                  }
                  return null;
                },
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
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 20),
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
                    width: 200,
                    height: 30,
                    decoration: BoxDecoration(
                      color: kButtonColor1,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Save',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                  onTap: () {
                    location = int.parse(HospitalLocation.text);
                    apploadHospitalInfo();
                  })
            ],
          ),
        ),
      ),
    );
  }

  dynamic apploadHospitalInfo() async {
    var action = ParseObject('HospitalDetails')
      ..set('adress', HospitalAdress.text.trim())
      ..set('phone_number', HospitalPhoneNumber.text.trim())
      ..set('isERavailable', isERavailable)
      ..set('location', location)
      ..set('hospitalWebsite', HospitalWebsite.text)
      ..set('hospitalStaff', HospitalStaff.text.trim());
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
