import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_app/models/authentication/update_info.dart';

class EducationPage extends StatefulWidget {
  final TextEditingController levelofeduController;
  final TextEditingController institutionController;
  final TextEditingController fieldController;
  final TextEditingController startdateController;
  final TextEditingController enddateController;
  final TextEditingController descriptionController;

  EducationPage({
    required this.levelofeduController,
    required this.institutionController,
    required this.fieldController,
    required this.startdateController,
    required this.enddateController,
    required this.descriptionController,
    Key? key,
  }) : super(key: key);

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  final UpdateUserInfo update_education = Get.put(UpdateUserInfo());

  void updateEdu() {
    update_education.updateUserInfo(
      education_detail: widget.levelofeduController.text +
          "," +
          widget.institutionController.text +
          "," +
          widget.fieldController.text +
          "," +
          widget.startdateController.text +
          "," +
          widget.enddateController.text +
          "," +
          widget.descriptionController.text,

    );
   
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
                  "Add Education",
                  style: GoogleFonts.poppins(
                      color: Color(0xFF150B3D),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                _buildTextField("Level of education", widget.levelofeduController),
                SizedBox(height: 10),
                _buildTextField("Institution name", widget.institutionController),
                SizedBox(height: 10),
                _buildTextField("Field of study", widget.fieldController),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField("Start Date", widget.startdateController),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: _buildTextField("End Date", widget.enddateController),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                _buildTextField("Description", widget.descriptionController, maxLines: 5),
                SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      updateEdu();
                      String educationDetail = widget.levelofeduController.text +
                          "," +
                          widget.institutionController.text +
                          "," +
                          widget.fieldController.text +
                          "," +
                          widget.startdateController.text +
                          "," +
                          widget.enddateController.text +
                          "," +
                          widget.descriptionController.text;
                      Navigator.pop(context, educationDetail);
                      print(educationDetail);
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

  Widget _buildTextField(String label, TextEditingController controller, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
              color: Color(0xFF150B3D),
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          height: maxLines == 1 ? 50 : 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.8)),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(10),
                hintText: "",
                hintStyle: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily)),
            maxLines: maxLines,
          ),
        ),
      ],
    );
  }
}
