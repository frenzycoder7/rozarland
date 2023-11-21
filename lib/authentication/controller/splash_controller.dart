import 'dart:async';

import 'package:get/get.dart';
import 'package:rozarland/authentication/screen/loginScreen.dart';
import 'package:rozarland/authentication/screen/signup_screen.dart';
import 'package:rozarland/screens/profile/screen/profile_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    Timer(Duration(seconds: 3), () {
      Get.toNamed(RegisterView.Route);
    });
    super.onInit();
  }
}
