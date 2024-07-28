import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/state_manager.dart';
import 'package:post_app/utilities/constant.dart';

class UpdateUserInfo extends GetxController {
  final isSaveLoading = false.obs;
  final saveError = {}.obs;

  void clearSaveError() {
    saveError.clear();
  }

  Future updateUserInfo({
    String? firstname,
    String? lastname,
    String? email,
    String? profile_pic,
    String? bio,
    String? cv,
    String? education_detail,
    String? experience,
    String? phone_number,
    String? address,
  }) async {
    final box = GetStorage();
    final token = box.read("token") ?? "";

    final Map<String, dynamic> data = {
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "profile_pic": profile_pic,
      "bio": bio,
      "cv": cv,
      "education_detail": education_detail,
      "experience": experience,
      "phone_number": phone_number,
      "address": address
    };
    print('Data before removal: ${jsonEncode(data)}');
    data.removeWhere((key, value) => value == null || value.isEmpty);
    print('Data after removal: ${jsonEncode(data)}');

    try {
      isSaveLoading.value = true;
      var response = await http.put(
        Uri.parse("${url}update"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        saveError.clear();
        print('Update successful');
        print('Response body: ${response.body}');
      } else {
        saveError.value = jsonDecode(response.body);
        print('Update failed');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      saveError.value = {"error": e.toString()};
      print(e.toString());
    } finally {
      isSaveLoading.value = false;
    }
  }
}
