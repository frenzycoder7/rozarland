import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:rozarland/app/controller/home_controller.dart';
import 'package:rozarland/app/controller/main_controller.dart';

class MainBinding extends Bindings{
    @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MainController());
  }


}