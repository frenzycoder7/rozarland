import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rozarland/app/controller/home_controller.dart';
import 'package:rozarland/app/controller/main_controller.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:rozarland/app/screen/home_screen.dart';
import 'package:rozarland/color.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  static const Route = '/mainScreen';
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          elevation: 0,
          actions: [
            CircleAvatar(
              radius: Get.width / 10,
              backgroundImage: NetworkImage(''),
              backgroundColor: Colors.green,
            ).paddingOnly(right: 0)
          ],
        ),
        body: <Widget>[
          HomeScreen(),
          HomeScreen(),
          HomeScreen()
        ][controller.currentIndex.value],
        bottomNavigationBar: Obx(
          () => NavigationBar(
            onDestinationSelected: (int index) {
              controller.currentIndex.value = index;
            },
            indicatorColor: ColorCode.lightGreen,
            selectedIndex: controller.currentIndex.value,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              // 10 min dena 
              NavigationDestination(
                icon: Icon(Icons.message),
                label: 'Chat',
              ),
              NavigationDestination(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ));
  }
}
