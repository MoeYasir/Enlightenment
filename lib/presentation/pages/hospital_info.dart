import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:health_providers/constants.dart';
import 'package:health_providers/data/location.dart';
import 'package:health_providers/presentation/pages/information_compelte.dart';
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
  TextEditingController HospitalWebsite = TextEditingController();
  TextEditingController HospitalLocation = TextEditingController();
  bool isERavailable = false;
  bool isAmbulance_available = false;
  bool isIcuAcailable = false;
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hello ,\nWe need some information to complete the registration ..',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
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
                      const SizedBox(
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
                      const SizedBox(
                        height: 5,
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
                        controller: HospitalPhoneNumber,
                        hintText: 'Enter your hostpital\'s main phone number',
                        pass: false,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      MyTextField(
                        controller: HospitalWebsite,
                        hintText: 'Enter your hostpital\'s website',
                        pass: false,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'ICU Available ?',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(fontSize: 20),
                                  ),
                                  Checkbox(
                                      value: isIcuAcailable,
                                      onChanged: (value) {
                                        setState(() {
                                          isIcuAcailable = value!;
                                        });
                                      }),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Ambulance Available ?',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 20),
                              ),
                              Checkbox(
                                  value: isAmbulance_available,
                                  onChanged: (value) {
                                    setState(() {
                                      isAmbulance_available = value!;
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
                                location = int.parse(HospitalLocation.text);
                                apploadHospitalInfo();
                              })
                        ],
                      ),
                    ]),
              ),
            ]),
          ),
        )));
  }

  Location _location = Location();

  dynamic apploadHospitalInfo() async {
    final currentLocation = await _location.getCurrentPosition();

    var action = ParseObject('HospitalDetails')
      ..set('adress', HospitalAdress.text.trim())
      ..set('phone_number', HospitalPhoneNumber.text.trim())
      ..set('isERavailable', isERavailable)
      ..set('isICUavailable', isIcuAcailable)
      ..set('isAmbulance_available', isAmbulance_available)
      ..set('hospitalWebsite', HospitalWebsite.text)
      ..set('hospitalStaff', HospitalStaff.text.trim())
      ..set('longitude', currentLocation.longitude)
      ..set('latitude', currentLocation.latitude);

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

  // Future<dynamic> uploadPharmacyInfo() async {
  //   var action = ParseObject('PharmacyDetails')
  //     ..set('adress', PharmacyAdress.text.trim())
  //     ..set('phone_number', PharmacyPhoneNumber.text.trim())
  //     ..set('pharmacyWebsite', PharmacyWebsite.text.trim());
  //   EasyLoading.show(status: 'Saving...', maskType: EasyLoadingMaskType.clear);
  //   await action.save();
  //   EasyLoading.showSuccess('Success');
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => InformationCompleted()));
  // }