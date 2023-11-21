import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:rozarland/screens/profile/screen/edit_profile.dart';

class ProfileView extends StatelessWidget {
  static const route = '/profile';
  Widget get sizedBox => SizedBox(height: Get.height * 0.02);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Container(
                height: Get.height * 0.20,
                width: Get.height * 0.20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular((Get.height * 0.20) / 2),
                  border: Border.all(color: Colors.black),
                ),
                // child: Image.network(),
              ),
            ),
            sizedBox,
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Test",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      Get.toNamed(EditProfileScreen.route);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Edit",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          Icons.edit,
                          size: 15,
                          color: Colors.blue.withOpacity(0.7),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            sizedBox,
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text("Mobile"),
              subtitle: Text("+91 xxxxxxxxx"),
            ),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text("test@gmail.com"),
            ),
            const ListTile(
              leading: Icon(Icons.usb),
              title: Text("Gender"),
              subtitle: Text("FeMale"),
            ),
            const ListTile(
              leading: Icon(Icons.location_city),
              title: Text("Address"),
              subtitle: Text("Noida "),
            ),
            const ListTile(
              leading: Icon(Icons.pin_drop),
              title: Text("Pincode"),
              subtitle: Text("829229"),
            ),
          ],
        ),
      ),
    );
  }
}
