import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:health_providers/constants.dart';
import 'package:health_providers/data/location.dart';
import 'package:health_providers/presentation/pages/information_compelte.dart';
import 'package:health_providers/presentation/widgets/text_field.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class AmbulanceInfo extends StatefulWidget {
  const AmbulanceInfo({Key? key}) : super(key: key);

  @override
  State<AmbulanceInfo> createState() => _AmbulanceInfoState();
}

class _AmbulanceInfoState extends State<AmbulanceInfo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController AmbulanceAdress = TextEditingController();
  TextEditingController AmbulanceAvailabilty = TextEditingController();
  TextEditingController AmbulancePhoneNumber = TextEditingController();
  TextEditingController AmbulanceWebsite = TextEditingController();
  TextEditingController AmbulanceLocation = TextEditingController();
  bool isAvailable = false;
  int? location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'General Information',
          // style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
        ),
        backgroundColor: kButtonColor1,
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0x007CBFCF),
                  Color(0xB316BFC4),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hello ,\nWe need some information to complete the registration',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    MyTextField(
                      controller: AmbulanceAdress,
                      hintText: 'Enter your address',
                      pass: false,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Can\'t be empty';
                        }

                        return null;
                      },
                    ),
                    MyTextField(
                      controller: AmbulanceLocation,
                      hintText: 'Enter your location',
                      pass: false,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Can\'t be empty';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    MyTextField(
                      controller: AmbulancePhoneNumber,
                      hintText: 'Enter your main phone number',
                      pass: false,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Can\'t be empty';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    MyTextField(
                      controller: AmbulanceWebsite,
                      hintText: 'Enter your provider\'s website',
                      pass: false,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Available ?',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Checkbox(
                            value: isAvailable,
                            onChanged: (value) {
                              setState(() {
                                isAvailable = value!;
                              });
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            location = int.parse(AmbulanceLocation.text);
                            apploadAmbulanceInfo();
                          } else {
                            return;
                          }
                        },
                        child: Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                            color: kButtonColor1,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              'Save',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Location _location = Location();

  Future<dynamic> apploadAmbulanceInfo() async {
    final currentLocation = await _location.getCurrentPosition();

    var action = ParseObject('AmbulanceDetails')
      ..set('adress', AmbulanceAdress.text.trim())
      ..set('phone_number', AmbulancePhoneNumber.text.trim())
      ..set('isAvailable', isAvailable)
      ..set('ambulanceWebsite', AmbulanceWebsite.text.trim())
      ..set('longitude', currentLocation.longitude)
      ..set('latitude', currentLocation.latitude);
    // ..set('hospitalStaff', AmbulanceAvailabilty);
    EasyLoading.show(status: 'Saving...', maskType: EasyLoadingMaskType.clear);
    await action.save();
    EasyLoading.showSuccess('Success');
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const InformationCompleted()));
  }
}
