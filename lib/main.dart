import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_providers/constants.dart';
import 'package:health_providers/presentation/pages/home.dart';
import 'package:health_providers/secondTryDesign/signup.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final keyApplicationId = 'Ox9aRljoEqPp2v3HOpJfhVuUy10VNtzcFJvzm3uK';
  final keyClientKey = '5GL04wgCdSCRmUoTJWPJUS3wi2p5wZYnUDWAyo7s';
  final keyParseServerUrl = 'https://parseapi.back4app.com';
  // final keyApplicationId = 'NYjW8dnCs0AoD7fcpVVdLKFLUTjeskMvOeMkknU6';
  // final keyClientKey = 'fDu4yPWVxm9z6LdUXbggrAVQcFuzYfzvMoa4AWht';
  // final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      title: 'Health Providers',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: GoogleFonts.poppins().copyWith(color: Colors.white),
          bodyText2: GoogleFonts.poppins().copyWith(color: Colors.black),

          // bodyText2: GoogleFonts.poppins().copyWith(color: Color(0xffF8ECD1)),
        ),

        // fontFamily: 'Montserrat',
      ),
      home: HomePage(),
    );
  }
}
