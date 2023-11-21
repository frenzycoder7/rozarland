// ignore_for_file: constant_identifier_names

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

enum PageStatus { LOADING, LOADED, ERROR, NETWORK_ERROR }

class ProfileController extends GetxController {
  String get token =>
      'Bearer 81|rIbJaEwStYyvTppZ8zM3cxTosNO4jGYJ9G22gPwjcf3a7582';
  String get _updateUrl =>
      'https://rozerland.micodetest.com/public/api/user_profile_update';
  String get _getProfileUrl =>
      'https://rozerland.micodetest.com/api/user_profile';

  // State variables
  Rx<PageStatus> pageStatus = PageStatus.LOADING.obs;

  getUserProfile() async {
    try {
      pageStatus(PageStatus.LOADING);
      http.Response response = await http.post(
        Uri.parse(_getProfileUrl),
        headers: {
          "Authorization": token,
        },
        body: {
          "id": "1"
        },
      );

      if (response.statusCode == 200) {
        pageStatus(PageStatus.LOADED);
      } else {
        pageStatus(PageStatus.ERROR);
        throw Exception(response.body.toString());
      }
    } catch (e) {
      pageStatus(PageStatus.ERROR);
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  updateUserProfile() async {
    try {
      pageStatus(PageStatus.LOADING);
      http.Response response = await http.post(
        Uri.parse(_updateUrl),
        headers: {
          "Authorization": token,
        },
        body: {},
      );

      if (response.statusCode == 200) {
        pageStatus(PageStatus.LOADED);
      } else {
        pageStatus(PageStatus.ERROR);
        throw Exception(response.body);
      }
    } catch (e) {
      pageStatus(PageStatus.ERROR);
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
