import 'dart:async';

import 'package:get/get.dart';

import '../../homescreen/view/homescreen_view.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Timer(Duration(seconds: 3), () {
      Get.to(() => HomeScreenView());
    });
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
