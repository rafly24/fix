import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/splash_screen_controller.dart';

// Splash Screen View
// ignore: must_be_immutable'
class SplashScreenView extends StatelessWidget {
  final SplashScreenController controller = Get.put(SplashScreenController());

  SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: Image.asset(
            'assets/images/R K, alphabet.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}