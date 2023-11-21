import 'package:get/instance_manager.dart';
import 'package:rozarland/screens/profile/controller/profile_controller.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
