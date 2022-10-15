import 'package:flutter/material.dart';
import 'package:health_providers/constants.dart';
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
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: kPrimaryColor,

              // fontFamily: 'Montserrat',
            ),
      ),
      home: SignUp(),
    );
  }
}

// This widget is the home page of your application. It is stateful, meaning
// that it has a State object (defined below) that contains fields that affect
// how it looks.

// This class is the configuration for the state. It holds the values (in this
// case the title) provided by the parent (in this case the App widget) and
// used by the build method of the State. Fields in a Widget subclass are
// always marked "final".
