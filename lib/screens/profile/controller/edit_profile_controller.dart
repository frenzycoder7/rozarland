// ignore_for_file: constant_identifier_names
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

enum PageStatus { LOADING, LOADED, ERROR, NETWORK_ERROR }

enum Fields { name, email, mobile, gender, address, pin, image }

extension CustomExtension on PageStatus {
  bool get isLoading => this == PageStatus.LOADING;
  bool get isLoaded => this == PageStatus.LOADED;
  bool get isError => this == PageStatus.ERROR;
  bool get isNetworkError => this == PageStatus.NETWORK_ERROR;
}

class EditProfileController extends GetxController {
  RxMap<String, dynamic> data = {
    Fields.name.name: "",
    Fields.email.name: "",
    Fields.mobile.name: "",
    Fields.gender.name: "",
    Fields.address.name: "",
    Fields.pin.name: "",
    Fields.image.name: "",
  }.obs;

  Rx<PageStatus> pageStatus = PageStatus.LOADED.obs;

  String get token =>
      'Bearer 81|rIbJaEwStYyvTppZ8zM3cxTosNO4jGYJ9G22gPwjcf3a7582';
  String get _updateUrl =>
      'https://rozerland.micodetest.com/public/api/user_profile_update';

  updateUserProfile() async {
    String path = data[Fields.image.name];
    if (path != "" && !path.contains('http') && !path.contains('https')) {
      makeMultiPartRequest();
    } else {
      makeJsonRequest();
    }
  }

  makeJsonRequest() async {
    try {
      pageStatus(PageStatus.LOADING);
      http.Response response = await http.post(
        Uri.parse(_updateUrl),
        headers: {
          "Authorization": token,
        },
        body: data,
      );

      if (response.statusCode == 200) {
        pageStatus(PageStatus.LOADED);
        Fluttertoast.showToast(msg: 'Profile Updated');
      } else {
        pageStatus(PageStatus.ERROR);
        throw Exception(response.body);
      }
    } catch (e) {
      pageStatus(PageStatus.ERROR);
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  makeMultiPartRequest() async {
    try {
      pageStatus(PageStatus.LOADING);
      http.MultipartRequest request = http.MultipartRequest(
        'POST',
        Uri.parse(_updateUrl),
      );
      request.fields.addAll({
        Fields.name.name: data[Fields.name.name],
        Fields.email.name: data[Fields.email.name],
        Fields.mobile.name: data[Fields.mobile.name],
        Fields.gender.name: data[Fields.gender.name],
        Fields.address.name: data[Fields.address.name],
        Fields.pin.name: data[Fields.pin.name],
      });
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        data[Fields.image.name],
      ));

      request.headers.addAll({
        "Authorization": token,
      });

      http.StreamedResponse res = await request.send();
      http.Response response = await http.Response.fromStream(res);
      print(response.statusCode);
      if (response.statusCode == 200) {
        pageStatus(PageStatus.LOADED);
        Fluttertoast.showToast(msg: "Profile Updated");
      } else {
        pageStatus(PageStatus.ERROR);
        throw Exception(response.body);
      }
    } catch (e) {
      print(e.toString());
      pageStatus(PageStatus.ERROR);
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  pickImage() async {
    try {
      XFile? file = await ImagePicker.platform
          .getImageFromSource(source: ImageSource.gallery);
      if (file != null) {
        data[Fields.image.name] = file.path;
        data.refresh();
      } else {
        Fluttertoast.showToast(msg: 'Image not selected');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
