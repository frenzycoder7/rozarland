import 'package:get/get.dart';
import 'package:rozarland/authentication/controller/signup_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RegisterController());
  }
}
