import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_app/screens/pages/profile/profile_content.dart';
import 'package:post_app/utilities/get_user.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GetUser _getUser = GetUser();
  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  TextEditingController _cvController = TextEditingController();
  TextEditingController _educationController = TextEditingController();
  TextEditingController _experienceController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  Future<void> fetchUser() async {
    var user = await _getUser.getuser();
    setState(() {
      _firstnameController.text = user["firstname"] ?? "";
      _lastnameController.text = user["lastname"] ?? "";
      _emailController.text = user["email"] ?? "";
      _bioController.text = user["bio"] ?? "";
      _cvController.text = user["cv"] ?? "";
      _educationController.text = user["education_detail"] ?? "";
      _experienceController.text = user["experience"] ?? "";
      _phoneController.text = user["phone_number"] ?? "";
      _addressController.text = user["address"] ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  "Your information",
                  style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF150B3D)),
                ),
              ),
              ProfileContent(
                title: "First Name",
                img: "about_me.png",
                controller: _firstnameController,
              ),
              ProfileContent(
                title: "Last Name",
                img: "about_me.png",
                controller: _lastnameController,
              ),
              ProfileContent(
                title: "Bio",
                img: "about_me.png",
                controller: _bioController,
              ),
              ProfileContent(
                title: "Education",
                img: "edu.png",
                controller: _educationController,
              ),
              ProfileContent(
                title: "Experience",
                img: "exp.png",
                controller: _experienceController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
