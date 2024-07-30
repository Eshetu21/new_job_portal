import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_app/screens/pages/profile/education.dart';
import 'package:post_app/screens/pages/profile/experience.dart';
import 'package:post_app/screens/pages/profile/edit_single.dart';
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

  TextEditingController _levelofeduController = TextEditingController();
  TextEditingController _institutionController = TextEditingController();
  TextEditingController _fieldController = TextEditingController();
  TextEditingController _startdateController = TextEditingController();
  TextEditingController _enddateController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  TextEditingController jobController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController expStartController = TextEditingController();
  TextEditingController expEndController = TextEditingController();
  TextEditingController expDescriptionController = TextEditingController();

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

      final educationDetails = user["education_detail"]?.split(',') ?? [];
      if (educationDetails.length == 6) {
        _levelofeduController.text = educationDetails[0];
        _institutionController.text = educationDetails[1];
        _fieldController.text = educationDetails[2];
        _startdateController.text = educationDetails[3];
        _enddateController.text = educationDetails[4];
        _descriptionController.text = educationDetails[5];
      }

      final experienceDetails = user["experience"]?.split(',') ?? [];
      if (experienceDetails.length == 5) {
        jobController.text = experienceDetails[0];
        companyController.text = experienceDetails[1];
        expStartController.text = experienceDetails[2];
        expEndController.text = experienceDetails[3];
        expDescriptionController.text = experienceDetails[4];
      }
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
              Container(
                margin:
                    EdgeInsets.only(top: 25, left: 30, right: 30, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/icons/edu.png'),
                        SizedBox(width: 5),
                        Text(
                          "Education",
                          style: GoogleFonts.poppins(
                              color: Color(0xFF150B3D),
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () async {
                            final educationDetail = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (content) => EducationPage(
                                        levelofeduController:
                                            _levelofeduController,
                                        institutionController:
                                            _institutionController,
                                        fieldController: _fieldController,
                                        startdateController:
                                            _startdateController,
                                        enddateController: _enddateController,
                                        descriptionController:
                                            _descriptionController)));
                            if (educationDetail != null &&
                                educationDetail.split(',').length == 6) {
                              setState(() {
                                _educationController.text = educationDetail;
                              });
                            } else {
                              print(
                                  'Invalid education detail format: $educationDetail');
                            }
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_fieldController.text,
                                style: GoogleFonts.poppins(
                                    color: Color(0xFF150B3D),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            Text(_institutionController.text),
                            Row(
                              children: [
                                Text(_startdateController.text),
                                Text(" "),
                                Text(_enddateController.text)
                              ],
                            )
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 25, left: 30, right: 30, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/icons/exp.png'),
                        SizedBox(width: 5),
                        Text(
                          "Experience",
                          style: GoogleFonts.poppins(
                              color: Color(0xFF150B3D),
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () async {
                            final experienceDetail = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (content) => ExperiencePage(
                                        jobController: jobController,
                                        companyController: companyController,
                                        expStartController: expStartController,
                                        expEndController: expEndController,
                                        expDescriptionController:
                                            expDescriptionController)));
                            if (experienceDetail != null &&
                                experienceDetail.split(',').length == 5) {
                              setState(() {
                                _educationController.text = experienceDetail;
                              });
                            } else {
                              print(
                                  'Invalid education detail format: $experienceDetail');
                            }
                          },
                          child: Container(
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(jobController.text,
                                style: GoogleFonts.poppins(
                                    color: Color(0xFF150B3D),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            Text(companyController.text),
                            Row(
                              children: [
                                Text(expStartController.text),
                                Text(" "),
                                Text(expEndController.text)
                              ],
                            )
                          ],
                        )),
                  ],
                ),
              ),
              ProfileContent(
                title: "Address",
                img: "exp.png",
                controller: _addressController,
              ),
              ProfileContent(
                title: "Phone Number",
                img: "exp.png",
                controller: _phoneController,
              ),
              ProfileContent(
                title: "CV",
                img: "exp.png",
                controller: _cvController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
