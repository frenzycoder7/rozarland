import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:rozarland/app/binding/All_order_binding.dart';
import 'package:rozarland/app/binding/all_category_binding.dart';
import 'package:rozarland/app/binding/all_service_binding.dart';
import 'package:rozarland/app/binding/main_binding.dart';
import 'package:rozarland/app/screen/all_categoriy_screen.dart';
import 'package:rozarland/app/screen/all_order_screen.dart';
import 'package:rozarland/app/screen/all_services_screen.dart';
import 'package:rozarland/app/screen/main_screen.dart';
import 'package:rozarland/authentication/binding/login_binding.dart';
import 'package:rozarland/authentication/binding/signup_binding.dart';
import 'package:rozarland/authentication/binding/splash_binding.dart';
import 'package:rozarland/authentication/screen/loginScreen.dart';
import 'package:rozarland/authentication/screen/signup_screen.dart';
import 'package:rozarland/authentication/screen/splash_screen.dart';
import 'package:rozarland/screens/profile/binding/edit_profile_binding.dart';
import 'package:rozarland/screens/profile/binding/profile_binding.dart';
import 'package:rozarland/screens/profile/screen/edit_profile.dart';
import 'package:rozarland/screens/profile/screen/profile_screen.dart';

void main() {
  runApp(const MYApp());
}

class MYApp extends StatelessWidget {
  const MYApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Rozarland",
      initialRoute: SplashScreen.route,
      getPages: [
        GetPage(
          name: ProfileView.route,
          page: () => ProfileView(),
          binding: ProfileBindings(),
        ),
        GetPage(name: EditProfileScreen.route, page: ()=> EditProfileScreen(),
        binding: EditProfileBinding()
        ),
        GetPage(
          name: SplashScreen.route,
          page: () => SplashScreen(),
          binding: SplashBinding(),
        ),
        GetPage(name: RegisterView.Route, page: ()=> RegisterView(),
        binding: RegisterBinding()
        ),
        GetPage(name: LoginScreen.Route, page: ()=> LoginScreen(),
        binding: LoginBinding(),
        ),
        GetPage(name: MainScreen.Route, page: ()=> MainScreen(),
        binding: MainBinding()
        ),
        GetPage(name: AllOrderScreen.route, page: ()=> AllOrderScreen(), 
        binding: AllOrderBinding()),
        GetPage(name: AllCategory.route, page: ()=> AllCategory(), binding: AllCategoryBinding()),
        GetPage(name: AllServicesScreen.route, page: ()=> AllServicesScreen(),
        binding: AllServicesBinding())

      ],
    );
  }
}
