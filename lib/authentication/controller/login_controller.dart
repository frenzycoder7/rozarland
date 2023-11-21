import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool showhidepassword = true.obs;
  RxBool isloading = false.obs;

  showHidePassword() {
    if (showhidepassword.value == false) {
      showhidepassword.value = true;
    } else {
      showhidepassword.value = false;
    }
  }

  performRegistration() async {
      try {
        isloading.value = true;
        final url =
            Uri.parse('https://my-map.booringcodes.in/api/user/register');
        http.Response response = await http.post(url, body: {
          "email": email.text,
          "password": password.text,
        });

        if (response.statusCode == 200) {
          Fluttertoast.showToast(msg: 'Account created');
          email.text = '';
          password.text = '';
        } else {
          Fluttertoast.showToast(msg: json.decode(response.body)['message']);
        }
        isloading.value = false;
      } catch (e) {
        isloading.value = false;
        Fluttertoast.showToast(msg: e.toString());
      }
    
  }


String? validatePassword(String? value) {
  if (value!.isEmpty) {
    return "Please Enter Password";
  }
  return null;
}


String? emailValidator(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null) {
    return 'Enter a Valid Email Address';
  } else if (value.isEmpty) {
    return "Please Enter Your email";
  } else if (!regex.hasMatch(value)) {
    return "Enter a Valid Email Address";
  } else {
    return null;
  }
}

}
