import 'package:get/get.dart';
import 'package:rozarland/authentication/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SplashController());
  }
}
