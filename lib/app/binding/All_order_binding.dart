import 'package:get/get.dart';
import 'package:rozarland/app/controller/All_order_controller.dart';

class AllOrderBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AllOrderController());
  }
}
