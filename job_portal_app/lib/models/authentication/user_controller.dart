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

  String getFieldValue(String field) {
    switch (field) {
      case 'First Name':
        return firstname.value;
      case 'Last Name':
        return lastname.value;
      case 'Email':
        return email.value;
      case 'Profile Pic':
        return profile_pic.value;
      case 'Bio':
        return bio.value;
      case 'CV':
        return cv.value;
      case 'Education':
        return education_detail.value;
      case 'Experience':
        return experience.value;
      case 'Phone Number':
        return phone_number.value;
      case 'Address':
        return address.value;
      default:
        return '';
    }
  }

  void setFieldValue(String field, String value) {
    switch (field) {
      case 'First Name':
        firstname.value = value;
        break;
      case 'Last Name':
        lastname.value = value;
        break;
      case 'Email':
        email.value = value;
        break;
      case 'Profile Pic':
        profile_pic.value = value;
        break;
      case 'Bio':
        bio.value = value;
        break;
      case 'CV':
        cv.value = value;
        break;
      case 'Education':
        education_detail.value = value;
        break;
      case 'Experience':
        experience.value = value;
        break;
      case 'Phone Number':
        phone_number.value = value;
        break;
      case 'Address':
        address.value = value;
        break;
    }
  }
}
