import 'package:get/get.dart';
import 'package:rozarland/screens/profile/controller/edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(EditProfileController());
  }
}
