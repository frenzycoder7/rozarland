import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rozarland/screens/profile/controller/edit_profile_controller.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({super.key});

  static const route = '/editProfile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile'),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.pageStatus.value.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.pageStatus.value.isError
                  ? Container(
                      alignment: Alignment.center,
                      child: IconButton(
                          icon: Icon(Icons.refresh),
                          onPressed: controller.updateUserProfile),
                    )
                  : controller.pageStatus.value.isNetworkError
                      ? Container()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: SizedBox(
                                height: Get.height / 6,
                                width: Get.height / 6,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: Get.height / 6,
                                      width: Get.height / 6,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          (Get.height / 6) / 2,
                                        ),
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          (Get.height / 6) / 2,
                                        ),
                                        child: _getImage(
                                            controller.data[Fields.image.name]),
                                      ),
                                    ),
                                    Container(
                                      height: Get.height / 6,
                                      width: Get.height / 6,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            (Get.height / 6) / 2,
                                          ),
                                          border:
                                              Border.all(color: Colors.black)),
                                      alignment: Alignment.bottomRight,
                                      child: IconButton(
                                        onPressed: controller.pickImage,
                                        icon: const Icon(Icons.add_a_photo),
                                      ),
                                    ),
                                  ],
                                ).paddingSymmetric(vertical: 25),
                              ),
                            ),
                            Text('Name',
                                    style: TextStyle(
                                        fontSize: Get.width / 24,
                                        color: const Color.fromARGB(
                                            255, 1, 42, 102)))
                                .paddingOnly(bottom: 10),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 15),
                                  focusColor: Color.fromARGB(255, 1, 42, 102),
                                  hintText: 'Enter name',
                                ),
                                onChanged: (value) {
                                  controller.data[Fields.name.name] = value;
                                },
                              ),
                            ).paddingOnly(bottom: Get.height / 35),
                            Text(
                              'Email',
                              style: TextStyle(
                                fontSize: Get.width / 24,
                                color: const Color.fromARGB(255, 1, 42, 102),
                              ),
                            ).paddingOnly(bottom: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                onChanged: (value) {
                                  controller.data[Fields.email.name] = value;
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 15),
                                  focusColor: Color.fromARGB(255, 1, 42, 102),
                                  hintText: 'Enter email',
                                ),
                              ),
                            ).paddingOnly(bottom: Get.height / 35),
                            Text(
                              'Mobile',
                              style: TextStyle(
                                fontSize: Get.width / 24,
                                color: const Color.fromARGB(255, 1, 42, 102),
                              ),
                            ).paddingOnly(bottom: 10),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                onChanged: (value) {
                                  controller.data[Fields.mobile.name] = value;
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 15),
                                  focusColor: Color.fromARGB(255, 1, 42, 102),
                                  hintText: 'Enter mobile number',
                                ),
                              ),
                            ).paddingOnly(bottom: Get.height / 35),
                            Text(
                              'Gender',
                              style: TextStyle(
                                fontSize: Get.width / 24,
                                color: const Color.fromARGB(255, 1, 42, 102),
                              ),
                            ).paddingOnly(bottom: 10),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                onChanged: (value) {
                                  controller.data[Fields.gender.name] = value;
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 15),
                                  focusColor: Color.fromARGB(255, 1, 42, 102),
                                  hintText: 'Enter gender',
                                ),
                              ),
                            ).paddingOnly(bottom: Get.height / 35),
                            Text(
                              'Address',
                              style: TextStyle(
                                fontSize: Get.width / 24,
                                color: const Color.fromARGB(255, 1, 42, 102),
                              ),
                            ).paddingOnly(bottom: 10),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                onChanged: (value) {
                                  controller.data[Fields.address.name] = value;
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 15),
                                  focusColor: Color.fromARGB(255, 1, 42, 102),
                                  hintText: 'Enter address',
                                ),
                              ),
                            ).paddingOnly(bottom: Get.height / 35),
                            Text(
                              'Pin',
                              style: TextStyle(
                                fontSize: Get.width / 24,
                                color: const Color.fromARGB(255, 1, 42, 102),
                              ),
                            ).paddingOnly(bottom: 10),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                onChanged: (value) {
                                  controller.data[Fields.pin.name] = value;
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 15),
                                  focusColor: Color.fromARGB(255, 1, 42, 102),
                                  hintText: 'Enter pin',
                                ),
                              ),
                            ).paddingOnly(bottom: Get.height / 30),
                            SizedBox(
                              width: Get.width,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 1, 42, 102),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 20),
                                  textStyle:
                                      TextStyle(fontSize: Get.height / 50),
                                ),
                                onPressed: controller.updateUserProfile,
                                child: const Text('SAVE'),
                              ),
                            ).paddingOnly(bottom: Get.height / 30)
                          ],
                        ).paddingSymmetric(horizontal: 20),
        ),
      ),
    );
  }

  Widget _getImage(String path) {
    if (path == "") {
      return Container(
        alignment: Alignment.center,
        child: const Icon(
          Icons.person,
          size: 50,
        ),
      );
    } else if (path.contains('http') || path.contains('https')) {
      return Image.network(path);
    } else {
      return Image.file(File(path));
    }
  }
}
