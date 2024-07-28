import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:post_app/utilities/constant.dart';

class GetUser {
  Future<Map<String, String>> getuser() async {
    final box = GetStorage();
    final token = box.read("token") ?? "";

    final response = await http.get(
      Uri.parse("${url}getuser"),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return {
        "firstname": responseData["firstname"] ?? "",
        "lastname": responseData["lastname"] ?? "",
        "email": responseData["email"] ?? "",
        "bio": responseData["bio"] ?? "",
        "cv": responseData["cv"] ?? "",
        "education_detail": responseData["education_detail"] ?? "",
        "experience": responseData["experience"] ?? "",
        "phone_number": responseData["phone_number"] ?? "",
        "address": responseData["address"] ?? "",
      };
    } else {
      throw Exception("Failed to get user data");
    }
  }
}
