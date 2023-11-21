import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class RegisterController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
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
          "name": name.text,
          "email": email.text,
          "password": password.text,
          'confirm_password': confirmPassword.text
        });

        if (response.statusCode == 200) {
          Fluttertoast.showToast(msg: 'Account created');
          name.text = '';
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


String? validateName(String? value) {
  if (value!.isEmpty) {
    return "Please Enter Your Name";
  }
  return null;
}

String? validateMobile(String? value) {
  if (value == null) {
    return "Please Enter Your Mobile Number";
  } else if (value.isEmpty) {
    return "Please Enter Your Mobile Number";
  } else if (value.length == 6) {
    return "Mobile Number Should be at least 7 Digits";
  } else if (value.length == 5) {
    return "Mobile Number Should be at least 7 Digits";
  } else if (value.length == 4) {
    return "Mobile Number Should be at least 7 Digits";
  } else if (value.length == 3) {
    return "Mobile Number Should be at least 7 Digits";
  } else if (value.length == 2) {
    return "Mobile Number Should be at least 7 Digits";
  } else if (value.length == 1) {
    return "Mobile Number Should be at least 7 Digits";
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

String? validatePassword(String? val) {
  bool hasUppercase = val!.contains(RegExp(r'[A-Z]'));
  bool hasDigits = val.contains(RegExp(r'[0-9]'));
  bool hasLowercase = val.contains(RegExp(r'[a-z]'));
  bool hasSpecialCharacters = val.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

  if (val.isEmpty) {
    return "Please enter your password";
  } else if (val.isEmpty) {
    return "Please Enter Your Password";
  } else if (!hasUppercase) {
    return "Should Contains One Capital Letter";
  } else if (!hasLowercase) {
    return "Should Contains One Small Char";
  } else if (!hasDigits) {
    return "Should Contains One Digit";
  } else if (!hasSpecialCharacters) {
    return "Should Contains One Special Char";
  } else if (val.length == 7) {
    return "Length Must Be 8";
  } else if (val.length == 6) {
    return "Length Must Be 8";
  } else if (val.length == 5) {
    return "Length Must Be 8";
  } else if (val.length == 4) {
    return "Length Must Be 8";
  } else if (val.length == 3) {
    return "Length Must Be 8";
  } else if (val.length == 2) {
    return "Length Must Be 8";
  } else if (val.length == 1) {
    return "Length Must Be 8";
  }
  return null;
}

String? confirmPasswordValidator(String? val) {
  if (val == null) {
    return "Please Enter Confirm Password";
  } else if (val.isEmpty) {
    return "Please Enter Confirm Password";
  } else if (val != password.text) {
    return "Password Should Be Same";
  } else {
    return null;
  }
}

}
