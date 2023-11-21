import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:rozarland/app/controller/all_services_controller.dart';

class AllServicesBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AllServicesController());
  }
}
