import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_app/models/authentication/update_info.dart';
import 'package:post_app/models/authentication/user_controller.dart';
import 'package:post_app/utilities/edit_content.dart';

class ProfileContent extends StatefulWidget {
  final String title;
  final String img;
  final TextEditingController controller;

  ProfileContent({
    required this.title,
    required this.img,
    required this.controller,
  });

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _profile_picController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _cvController = TextEditingController();
  final TextEditingController _educationController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final UpdateUserInfo updateuserinfo = Get.put(UpdateUserInfo());
  final UserController userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    widget.controller.text = userController.getFieldValue(widget.title);
  }

  void saveInfo(String field, String value) {
    print('First Name: ${_firstnameController.text}');
    print('Last Name: ${_lastnameController.text}');
    print('Email: ${_emailController.text}');
    print('Profile Pic: ${_profile_picController.text}');
    print('Bio: ${_bioController.text}');
    print('CV: ${_cvController.text}');
    print('Education Detail: ${_educationController.text}');
    print('Experience: ${_experienceController.text}');
    print('Phone Number: ${_phoneController.text}');
    print('Address: ${_addressController.text}');

    userController.setFieldValue(field, value);

    updateuserinfo.updateUserInfo(
      firstname: _firstnameController.text,
      lastname: _lastnameController.text,
      email: _emailController.text,
      profile_pic: _profile_picController.text,
      bio: _bioController.text,
      cv: _cvController.text,
      education_detail: _educationController.text,
      experience: _experienceController.text,
      phone_number: _phoneController.text,
      address: _addressController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    print(userController.firstname.value);
    TextEditingController specificController;

    switch (widget.title) {
      case 'First Name':
        specificController = _firstnameController;
        break;
      case 'Last Name':
        specificController = _lastnameController;
        break;
      case 'Email':
        specificController = _emailController;
        break;
      case 'Profile Pic':
        specificController = _profile_picController;
        break;
      case 'Bio':
        specificController = _bioController;
        break;
      case 'CV':
        specificController = _cvController;
        break;
      case 'Education':
        specificController = _educationController;
        break;
      case 'Experience':
        specificController = _experienceController;
        break;
      case 'Phone Number':
        specificController = _phoneController;
        break;
      case 'Address':
        specificController = _addressController;
        break;
      default:
        specificController = TextEditingController();
    }

    specificController.text = widget.controller.text;

    return Container(
      margin: EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('assets/icons/${widget.img}'),
              SizedBox(width: 5),
              Text(
                widget.title,
                style: GoogleFonts.poppins(
                    color: Color(0xFF150B3D), fontWeight: FontWeight.bold),
              ),
              Spacer(),
              GestureDetector(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditContent(
                        title: widget.title,
                        hintText:
                            "Write your ${widget.title.toLowerCase()} here",
                        controller: specificController,
                        height: 180,
                        saveInfo: () =>
                            saveInfo(widget.title, specificController.text),
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      Text(
                        "Edit",
                        style: GoogleFonts.poppins(
                            color: Color(0xFF150B3D),
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.mode_edit_outline_outlined,
                        color: Color(0xFFFCA34D),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white.withOpacity(0.7),
            ),
            child: Obx(
              () => Text(
                userController.getFieldValue(widget.title).isEmpty
                    ? "Empty"
                    : userController.getFieldValue(widget.title),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
