import 'package:get/get.dart';

class UserController extends GetxController {
  var firstname = ''.obs;
  var lastname = ''.obs;
  var email = ''.obs;
  var profile_pic = ''.obs;
  var bio = ''.obs;
  var cv = ''.obs;
  var education_detail = ''.obs;
  var experience = ''.obs;
  var phone_number = ''.obs;
  var address = ''.obs;

   void setUser(Map<String, dynamic> user) {
    firstname.value = user["firstname"] ?? "";
    lastname.value = user["lastname"] ?? "";
    email.value = user["email"] ?? "";
    profile_pic.value = user["profile_pic"] ?? "";
    bio.value = user["bio"] ?? "";
    cv.value = user["cv"] ?? "";
    education_detail.value = user["education_detail"] ?? "";
    experience.value = user["experience"] ?? "";
    phone_number.value = user["phone_number"] ?? "";
    address.value = user["address"] ?? "";
  }
}
