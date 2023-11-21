import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rozarland/app/controller/home_controller.dart';
import 'package:rozarland/app/screen/all_categoriy_screen.dart';
import 'package:rozarland/app/screen/all_order_screen.dart';
import 'package:rozarland/app/screen/all_services_screen.dart';
import 'package:rozarland/color.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              height: Get.height / 14,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 15,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: Center(
                child: TextFormField(
                  controller: controller.searchController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: 18,
                      color: Color.fromARGB(255, 7, 21, 73),
                    ),
                    hintText: 'Search',
                    hintStyle:
                        TextStyle(fontSize: 14, color: Colors.grey.shade700),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              height: Get.height / 5,
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Get.width / 20),
                  color: ColorCode.appColor),
              child: Row(children: [
                Container(
                  width: Get.width / 2.8,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Get.height / 50, horizontal: Get.width / 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '25% OFF',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: Get.width / 18,
                            color: Colors.white),
                      ),
                      Text(
                        'For every cleaning today',
                        style: GoogleFonts.poppins(
                            fontSize: Get.width / 28, color: Colors.white),
                        maxLines: 2,
                      ).paddingSymmetric(vertical: Get.height / 70),
                      SizedBox(
                        // width: Get.width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.shade800,
                            ),
                            onPressed: () {},
                            child: Text(
                              'Book Now',
                              style: GoogleFonts.poppins(color: Colors.white),
                            )),
                      )
                    ],
                  ),
                )
              ]),
            ).paddingSymmetric(vertical: Get.height / 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categiories',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: Get.width / 20),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AllCategory.route);
                  },
                  child: Text(
                    'See All',
                    style: GoogleFonts.poppins(
                        fontSize: Get.width / 24, color: ColorCode.appColor),
                  ),
                ),
              ],
            ).paddingOnly(bottom: Get.height / 50),
            Container(
                height: Get.height / 10,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        width: Get.width / 3.5,
                        padding: EdgeInsets.symmetric(
                            horizontal: Get.width / 25,
                            vertical: Get.width / 25),
                        decoration: BoxDecoration(
                            color: ColorCode.appColor,
                            borderRadius:
                                BorderRadius.circular(Get.width / 25)),
                        child: Center(
                            child: Text(
                          'AC Services',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: Get.width / 30),
                        )),
                      ).paddingOnly(right: Get.width / 35);
                    })),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Other Services',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: Get.width / 20),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AllServicesScreen.route);
                  },
                  child: Text(
                    'See All',
                    style: GoogleFonts.poppins(
                        fontSize: Get.width / 24, color: ColorCode.appColor),
                  ),
                ),
              ],
            ).paddingSymmetric(vertical: Get.height / 50),
            Container(
                height: Get.height / 6,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        width: Get.width / 3.5,
                        padding: EdgeInsets.symmetric(
                            horizontal: Get.width / 25,
                            vertical: Get.width / 25),
                        decoration: BoxDecoration(
                            color: ColorCode.appColor,
                            borderRadius:
                                BorderRadius.circular(Get.width / 25)),
                        child: Center(
                            child: Column(
                          children: [
                            Container(
                              height: Get.width / 7,
                              width: Get.width / 7,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(Get.width / 5)),
                              child: Icon(Icons.car_repair),
                            ),
                            Text(
                              'Gas filling',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: Get.width / 30),
                            ).paddingOnly(top: Get.height / 60),
                          ],
                        )),
                      ).paddingOnly(right: Get.width / 35);
                    })),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order Again',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: Get.width / 20),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AllOrderScreen.route);
                  },
                  child: Text(
                    'See All',
                    style: GoogleFonts.poppins(
                        fontSize: Get.width / 24, color: ColorCode.appColor),
                  ),
                ),
              ],
            ).paddingSymmetric(vertical: Get.height / 50),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width / 25, vertical: Get.height / 60),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Get.width / 25),
                  color: Colors.white),
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
            ).paddingOnly(bottom: Get.height / 50)
          ],
        ).paddingSymmetric(horizontal: Get.width / 25),
      ),
    );
  }
}
