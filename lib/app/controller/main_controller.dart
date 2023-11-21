import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxInt currentIndex = 0.obs;
}
