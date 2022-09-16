import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controller/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashScreenController> {
  const SplashscreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      body: Center(
        child: Text("SplashScreen"),
      ),
    );
  }
}
