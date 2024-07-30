// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_app/models/authentication/update_info.dart';

class ExperiencePage extends StatefulWidget {
  TextEditingController jobController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController expStartController = TextEditingController();
  TextEditingController expEndController = TextEditingController();
  TextEditingController expDescriptionController = TextEditingController();

  ExperiencePage({
    required this.jobController,
    required this.companyController,
    required this.expStartController,
    required this.expEndController,
    required this.expDescriptionController,
  });

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  final UpdateUserInfo updateExperience = Get.put(UpdateUserInfo());
  void UpdateExp() {
    updateExperience.updateUserInfo(
        experience: widget.jobController.text +
            "," +
            widget.companyController.text +
            "," +
            widget.expStartController.text +
            "," +
            widget.expEndController.text +
            "," +
            widget.expDescriptionController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_outlined,
                    color: Color(0xFF3B4657),
                    size: 28,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Add work experience",
                  style: GoogleFonts.poppins(
                      color: Color(0xFF150B3D),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Job Title",
                  style: GoogleFonts.poppins(
                      color: Color(0xFF150B3D),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.8)),
                  child: TextField(
                    controller: widget.jobController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        hintText: "",
                        hintStyle: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily)),
                    maxLines: null,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Company",
                  style: GoogleFonts.poppins(
                      color: Color(0xFF150B3D),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.8)),
                  child: TextField(
                    controller: widget.companyController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        hintText: "",
                        hintStyle: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily)),
                    maxLines: null,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Start Date",
                            style: GoogleFonts.poppins(
                                color: Color(0xFF150B3D),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white.withOpacity(0.8)),
                            child: TextField(
                              controller: widget.expStartController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: "DD/MM/YY",
                                  hintStyle: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily)),
                              maxLines: null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "End Date",
                            style: GoogleFonts.poppins(
                                color: Color(0xFF150B3D),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white.withOpacity(0.8)),
                            child: TextField(
                              controller: widget.expEndController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: "DD/MM/YY",
                                  hintStyle: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily)),
                              maxLines: null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Description",
                  style: GoogleFonts.poppins(
                      color: Color(0xFF150B3D),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.8)),
                  child: TextField(
                    controller: widget.expDescriptionController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        hintText: "",
                        hintStyle: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily)),
                    maxLines: null,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    onTap: () {
                        UpdateExp();
                      String experienceDetail = widget.jobController.text +
                          "," +
                          widget.companyController.text +
                          "," +
                          widget.expStartController.text +
                          "," +
                          widget.expEndController.text +
                          "," +
                          widget.expDescriptionController.text;
                      Navigator.pop(context, experienceDetail);
                      print(experienceDetail);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 80),
                      width: 266,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF130160),
                      ),
                      child: Center(
                        child: Text("SAVE",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
