import 'package:get/get.dart';
import 'package:rozarland/app/controller/all_category_controller.dart';

class AllCategoryBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AllCategoryController());
  }
}
