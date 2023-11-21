import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rozarland/color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const route = '/splashScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(

            ),
            Text(
              'Rozarland',
              style: GoogleFonts.poppins(fontSize: Get.width/18, color: ColorCode.appColor)).paddingOnly(top: Get.height/40),
          
          ],
        ),
      ),
    );
  }
}
