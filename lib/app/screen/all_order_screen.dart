import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:rozarland/color.dart';

class AllOrderScreen extends StatelessWidget {
  const AllOrderScreen({super.key});

  static const route = '/allOrderScreen';

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
                  Text('Order History', style: GoogleFonts.poppins(fontSize: Get.width/24, fontWeight: FontWeight.w600),)
            ],
          ).paddingOnly(top: Get.height/30),
          ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width / 25, vertical: Get.height / 60),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Get.width / 25),
                      color: ColorCode.lightGreen),
                  child: Row(
                    children: [
                      Container(
                          width: Get.width / 4,
                          decoration: BoxDecoration(color: Colors.grey)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'House cleaning',
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: Get.width / 23),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('4.7'),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  )
                                ],
                              ).paddingOnly(left: Get.width / 20)
                            ],
                          ),
                          Text('Hardin')
                              .paddingSymmetric(vertical: Get.height / 150),
                          Row(
                            children: [
                              Text(
                                '\$30',
                                style: GoogleFonts.poppins(
                                    color: ColorCode.appColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(' /hr')
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ).paddingOnly(bottom: Get.height / 50);
              })
        ],
      ).paddingSymmetric(horizontal: Get.width/25),
    );
  }
}
