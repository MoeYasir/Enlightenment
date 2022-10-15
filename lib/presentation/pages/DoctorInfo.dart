import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:health_providers/constants.dart';
import 'package:health_providers/presentation/pages/information_compelte.dart';
import 'package:health_providers/presentation/widgets/button.dart';
import 'package:health_providers/presentation/widgets/text_field.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  TextEditingController DoctorLocation = TextEditingController();
  TextEditingController DoctorWebsite = TextEditingController();
  bool isAvailable = false;
  int? location;

  @override
  void initState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = prefs.getString('name');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('General Informtion'),
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
                  hintText: 'Enter your adress',
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

                    return null;
                  },
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
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
        ),
      ),
    );
  }

  Future<dynamic> apploadDoctorInfo() async {
    var action = ParseObject('DoctorDetails')
      ..set('adress', DoctorAdress.text.trim())
      ..set('phone_number', DoctorPhoneNumber.text.trim())
      ..set('isAvailable', isAvailable)
      ..set('location', location)
      ..set('DoctorWebsite', DoctorWebsite.text.trim());
    // ..set('hospitalStaff', DoctorAvailabilty);
    EasyLoading.show(status: 'Saving...', maskType: EasyLoadingMaskType.clear);
    await action.save();
    EasyLoading.showSuccess('Success');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => InformationCompleted()));
  }
}
