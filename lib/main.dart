import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:health_providers/outside/login_screen/login_screen.dart';
import 'package:health_providers/presentation/pages/home.dart';
import 'package:health_providers/presentation/pages/login_page.dart';
import 'package:health_providers/presentation/pages/signup_page.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'outside/utils/konstant.dart';

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
        builder: EasyLoading.init(),
        title: 'Health Providers',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: kPrimaryColor,
                // fontFamily: 'Montserrat',
              ),
        ),
        home: HomePage());
  }
}
