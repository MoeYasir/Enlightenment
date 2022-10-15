import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:health_providers/constants.dart';
import 'package:health_providers/secondTryDesign/splash-screen.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final keyApplicationId = 'Ox9aRljoEqPp2v3HOpJfhVuUy10VNtzcFJvzm3uK';
  final keyClientKey = '5GL04wgCdSCRmUoTJWPJUS3wi2p5wZYnUDWAyo7s';
  final keyParseServerUrl = 'https://parseapi.back4app.com';
  // final keyApplicationId = 'NYjW8dnCs0AoD7fcpVVdLKFLUTjeskMvOeMkknU6';
  // final keyClientKey = 'fDu4yPWVxm9z6LdUXbggrAVQcFuzYfzvMoa4AWht';
  // final keyParseServerUrl = 'https://parseapi.back4app.com';
  SharedPreferences preferences = await SharedPreferences.getInstance();

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      title: 'zoal care',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: kPrimaryColor,
            ),
      ),
      home: const SplashScreen(),
    );
  }
}
