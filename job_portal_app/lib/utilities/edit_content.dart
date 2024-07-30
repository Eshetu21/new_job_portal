import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_app/models/authentication/update_info.dart';
import 'package:post_app/models/authentication/user_controller.dart';

class EditContent extends StatefulWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final double height;
  final Function saveInfo;

  EditContent({
    required this.title,
    required this.hintText,
    required this.controller,
    required this.height,
    required this.saveInfo,
  });

  @override
  State<EditContent> createState() => _EditContentState();
}

class _EditContentState extends State<EditContent> {
  final UserController userController = Get.find<UserController>();
  final UpdateUserInfo updateuserinfo = Get.put(UpdateUserInfo());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: SafeArea(
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
                widget.title,
                style: GoogleFonts.poppins(
                    color: Color(0xFF150B3D),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                height: widget.height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.8)),
                child: TextField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                      hintText: widget.hintText,
                      hintStyle: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily)),
                  maxLines: null,
                ),
              ),
              Spacer(),
              Center(
                child: Obx(() {
                  return updateuserinfo.isSaveLoading.value
                      ? CircularProgressIndicator()
                      : GestureDetector(
                          onTap: () {
                            widget.saveInfo();
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
                        );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
