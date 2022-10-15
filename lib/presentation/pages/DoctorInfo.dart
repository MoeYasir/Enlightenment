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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController DoctorAdress = TextEditingController();
  TextEditingController DoctorAvailabilty = TextEditingController();
  TextEditingController DoctorPhoneNumber = TextEditingController();
  TextEditingController DoctorWebsite = TextEditingController();
  bool isAvailable = false;
<<<<<<< Updated upstream
=======
  int? location;

  // @override
  // void initState() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var username = prefs.getString('name');
  //   // TODO: implement initState
  //   super.initState();
  // }
>>>>>>> Stashed changes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('General Information'),
        backgroundColor: kButtonColor1,
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
<<<<<<< Updated upstream
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
                  controller: DoctorAdress,
                  hintText: 'Enter your address',
                  pass: false,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Can\'t be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                MyTextField(
                  controller: DoctorPhoneNumber,
                  hintText: 'Enter your main phone number',
                  pass: false,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Can\'t be empty';
                    }
=======
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
                      'Hello ,\nWe need some information to complete the registration ..',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    MyTextField(
                      controller: DoctorAdress,
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
                      controller: DoctorLocation,
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
                      controller: DoctorPhoneNumber,
                      hintText: 'Enter your main phone number',
                      pass: false,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Can\'t be empty';
                        }
>>>>>>> Stashed changes

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    MyTextField(
                      controller: DoctorWebsite,
                      hintText: 'Enter your website',
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
<<<<<<< Updated upstream
                  ),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      apploadDoctorInfo();
                    } else {
                      return;
                    }
                  },
                )
              ],
=======
                    GestureDetector(
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
                            style:
                                // Theme.of(context)
                                //     .textTheme
                                //     .bodyText1!
                                //     .copyWith(
                                //         fontWeight: FontWeight.bold, fontSize: 15),
                                TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          location = int.parse(DoctorLocation.text);
                          apploadDoctorInfo();
                        } else {
                          return;
                        }
                      },
                    )
                  ],
                ),
              ),
>>>>>>> Stashed changes
            ),
          ),
        ),
      ),
    );
  }

  Location _location = Location();

  Future<dynamic> apploadDoctorInfo() async {
    final currentLocation = await _location.getCurrentPosition();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var action = ParseObject('DoctorDetails')
<<<<<<< Updated upstream
      ..objectId
      ..set('doctorID', prefs.get('objectId'))
      ..set('adress', DoctorAdress.text.trim())
      ..set('phone_number', DoctorPhoneNumber.text.trim())
      ..set('isAvailable', isAvailable)
      ..set('DoctorWebsite', DoctorWebsite.text.trim())
      ..set('longitude', currentLocation.longitude)
      ..set('latitude', currentLocation.latitude);
    // ..set('hospitalStaff', DoctorAvailabilty);
=======
      ..set('address', DoctorAdress.text.trim())
      ..set('phone_number', DoctorPhoneNumber.text.trim())
      ..set('isAvailable', isAvailable)
      ..set('location', location)
      ..set('DoctorWebsite', DoctorWebsite.text.trim());
    // ..set('hospitalStaff', DoctorAvailability);
>>>>>>> Stashed changes
    EasyLoading.show(status: 'Saving...', maskType: EasyLoadingMaskType.clear);
    await action.save();
    EasyLoading.showSuccess('Success');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const InformationCompleted()));
  }
}
