import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rozarland/app/screen/main_screen.dart';
import 'package:rozarland/authentication/controller/login_controller.dart';
import 'package:rozarland/authentication/controller/signup_controller.dart';
import 'package:rozarland/authentication/screen/signup_screen.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({super.key});

  static const Route = '/login';

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 120,
              ),
              Center(
                child: Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 7, 21, 73),
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Text(
                ' Email',
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 7, 21, 73),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Container(
                height: 45,
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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => controller.emailValidator(value),
                    controller: controller.email,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_rounded,
                        size: 18,
                        color: Color.fromARGB(255, 7, 21, 73),
                      ),
                      hintText: 'Enter Email',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                ' Password',
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 7, 21, 73),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Obx(
                () {
                  return Container(
                    height: 45,
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            controller.validatePassword(value),
                        controller: controller.password,
                        obscureText: controller.showhidepassword.value,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            size: 18,
                            color: Color.fromARGB(255, 7, 21, 73),
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              controller.showHidePassword();
                            },
                            child: const Icon(
                              Icons.remove_red_eye,
                              size: 18,
                              color: Color.fromARGB(255, 7, 21, 73),
                            ),
                          ),
                          hintText: 'Enter password',
                          hintStyle:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Obx(() {
                return controller.isloading.isFalse
                    ? ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Get.toNamed(MainScreen.Route);
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 7, 21, 73),
                          ),
                          minimumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 50),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 2,
                          ),
                        ),
                      )
                    : Center(child: CircularProgressIndicator());
              }),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' Create an account ? ',
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 7, 21, 73),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offAndToNamed(RegisterView.Route);
                    },
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 7, 21, 73),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
