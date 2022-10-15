import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../presentation/pages/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToHomePage();
    super.initState();
  }

  void goToHomePage() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white.withOpacity(1),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // kButtonColor1.withOpacity(.9),
                Color(0x007CBFCF),
                Color(0xB316BFC4),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/logo/take_charge_of_your_health_icon.png',
                  scale: 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: AnimatedTextKit(
                      pause: const Duration(milliseconds: 400),
                      totalRepeatCount: 3,
                      animatedTexts: [
                        ColorizeAnimatedText('Zool Care',
                            textStyle: const TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                            colors: [
                              // Color(0x007CBFCF),
                              kButtonColor1.withOpacity(.9),
                              const Color(0xB316BFC4),
                            ]),
                      ]),
                ),
              ],
            ),
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
