import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_app/screens/pages/profile/edit_profile.dart';
import 'package:post_app/utilities/get_user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
    print(_bioController.text);
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/profile_bg.png"),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/avatar.png", width: 60),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          _firstnameController.text,
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Text(
                          _lastnameController.text,
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(_emailController.text,
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.phone_android_outlined,
                            color: Colors.white, size: 18),
                        Text(
                          _phoneController.text.isEmpty
                              ? "unknown"
                              : _phoneController.text,
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            color: Colors.white, size: 18),
                        Text(
                          _addressController.text.isEmpty
                              ? "unknown"
                              : _addressController.text,
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (content) => EditProfile()));
                          },
                          child: Container(
                            height: 30,
                            child: Row(
                              children: [
                                Text("Edit profile",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white, fontSize: 12)),
                                SizedBox(width: 5),
                                Image.asset(
                                  "assets/icons/edit.png",
                                  width: 18,
                                  height: 18,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(top:20,left: 20,right: 20,bottom: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/icons/about_me.png"),
                        SizedBox(width: 5),
                        Text("Bio",style: GoogleFonts.poppins(
                              color: Color(0xFF150B3D),
                              fontWeight: FontWeight.bold),)
                      ],
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white.withOpacity(0.7)),
                      child: _bioController.text==""?Text("No bio "): Text(_bioController.text),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/icons/edu.png"),
                        SizedBox(width: 5),
                        Text("Education",style: GoogleFonts.poppins(
                              color: Color(0xFF150B3D),
                              fontWeight: FontWeight.bold),)
                      ],
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white.withOpacity(0.7)),
                      child: _educationController.text==""?Text("No education "): Text(_educationController.text),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/icons/exp.png"),
                        SizedBox(width: 5),
                        Text("Experience",style: GoogleFonts.poppins(
                              color: Color(0xFF150B3D),
                              fontWeight: FontWeight.bold),)
                      ],
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white.withOpacity(0.7)),
                      child: _experienceController.text==""?Text("No experience "): Text(_experienceController.text),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
