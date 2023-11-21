import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rozarland/color.dart';


class AllCategory extends StatelessWidget {
  const AllCategory({super.key});

  static const route = '/allCategory';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios, size: Get.width/20,)),
                  Text('Category', style: GoogleFonts.poppins(fontSize: Get.width/24, fontWeight: FontWeight.w600),)
            ],
          ).paddingOnly(top: Get.height/30),
          Container(
            width: Get.width,
            height: Get.height/1.5,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, 
                mainAxisSpacing: Get.width/25, 
                crossAxisSpacing: Get.width/25, 
              ),
              padding: EdgeInsets.all(8.0), 
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: Get.width/3.5,
                  width:  Get.width/3.5,
                  decoration: BoxDecoration(
                    color: ColorCode.lightGreen,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(Get.width/20), bottomRight: Radius.circular(Get.width/20))
                  ),
                  
                  child: Center(
                    child: Text(
            'category',
            style: TextStyle(fontSize: 18.0, color: Colors.grey.shade800),
                    ),
                  ),
                );
              },
            ),
          )

        ],
      ).paddingSymmetric(horizontal: Get.width/35),
    );
  }
}
