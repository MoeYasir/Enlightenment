import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:health_providers/constants.dart';
import 'package:health_providers/data/location.dart';
import 'package:health_providers/presentation/pages/information_compelte.dart';
import 'package:health_providers/presentation/widgets/text_field.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class DoctorInfo extends StatefulWidget {
  const DoctorInfo({Key? key}) : super(key: key);

  @override
  State<DoctorInfo> createState() => _DoctorInfoState();
}

class _DoctorInfoState extends State<DoctorInfo> {
  TextEditingController doctorAdress = TextEditingController();
  TextEditingController doctorDrugs = TextEditingController();
  TextEditingController doctorPhoneNumber = TextEditingController();
  TextEditingController doctorWebsite = TextEditingController();
  TextEditingController doctorLocation = TextEditingController();
  bool isAvialble = false;
  int? location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'General Informtion',
            // style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
          ),
          backgroundColor: kButtonColor1.withOpacity(.9),
        ),
        body: SafeArea(
            child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0x007CBFCF),
                Color(0xB316BFC4),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hello ,\nWe need some information to complete the registration ..',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        MyTextField(
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Can\'t be empty';
                            }

                            return null;
                          },
                          controller: doctorAdress,
                          hintText: 'Enter your address',
                          pass: false,
                        ),
                        MyTextField(
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Can\'t be empty';
                            }

                            return null;
                          },
                          controller: doctorLocation,
                          hintText: 'Enter your location',
                          pass: false,
                        ),
                        const SizedBox(
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
                          controller: doctorPhoneNumber,
                          hintText: 'Enter your main phone number',
                          pass: false,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        MyTextField(
                          controller: doctorWebsite,
                          hintText: 'Enter your hostpital\'s website',
                          pass: false,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Always available ?',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(fontSize: 20),
                            ),
                            Checkbox(
                                value: isAvialble,
                                onChanged: (value) {
                                  setState(() {
                                    isAvialble = value!;
                                    print(isAvialble);
                                  });
                                }),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                            child: Container(
                              width: 200,
                              height: 40,
                              decoration: BoxDecoration(
                                color: kButtonColor1,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: const Text('Save',
                                    style:
                                        // Theme.of(context)
                                        //     .textTheme
                                        //     .bodyText1!
                                        //     .copyWith(
                                        //         fontWeight: FontWeight.bold, fontSize: 15),
                                        const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                              ),
                            ),
                            onTap: () {
                              location = int.parse(doctorLocation.text);
                              apploadDoctorInfo();
                            })
                      ]),
                ),
              ],
            ),
          ),
        )));
  }

  Location _location = Location();

  dynamic apploadDoctorInfo() async {
    final currentLocation = await _location.getCurrentPosition();

    var action = ParseObject('PharmacyDetails')
      ..set('adress', doctorAdress.text.trim())
      ..set('phone_number', doctorPhoneNumber.text.trim())
      ..set('doctorWebsite', doctorWebsite.text)
      ..set('longitude', currentLocation.longitude)
      ..set('latitude', currentLocation.latitude)
      ..set('isAvailable', isAvialble);

    EasyLoading.show(status: 'Saving...', maskType: EasyLoadingMaskType.clear);
    var res = await action.save();
    if (res.success) {
      EasyLoading.showSuccess('Success');
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const InformationCompleted()));
    } else {
      EasyLoading.showError('network error try again');
    }
  }
}

  // Future<dynamic> uploadDoctorInfo() async {
  //   var action = ParseObject('PharmacyDetails')
  //     ..set('adress', doctorAdress.text.trim())
  //     ..set('phone_number', doctorPhoneNumber.text.trim())
  //     ..set('doctorWebsite', doctorWebsite.text.trim());
  //   EasyLoading.show(status: 'Saving...', maskType: EasyLoadingMaskType.clear);
  //   await action.save();
  //   EasyLoading.showSuccess('Success');
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => InformationCompleted()));
  // }