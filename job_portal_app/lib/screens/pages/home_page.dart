import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_app/screens/pages/profile/profile.dart';
import 'package:post_app/utilities/get_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _firstnameController = TextEditingController();
  final GetUser _getUser = GetUser();

  Future<void> fetchuser() async {
    var user = await _getUser.getuser();
    setState(() {
      _firstnameController.text = user["firstname"] ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    fetchuser();
  }

  @override
  Widget build(BuildContext context) {
    print(_firstnameController.text);
    return Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        body: SafeArea(
            child: Container(
                margin: EdgeInsets.only(top: 20, right: 10, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text("Hello",
                              style: GoogleFonts.poppins(
                                  fontSize: 34, color: Color(0xFF0D0140))),
                        ),
                        Spacer(),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfilePage()));
                            },
                            child: Image.asset(
                              "assets/images/avatar.png",
                              width: 40,
                            ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(_firstnameController.text,
                          style: GoogleFonts.poppins(
                              fontSize: 26, color: Color(0xFF0D0140))),
                    ),
                    SizedBox(height: 12),
                    Container(
                        padding: EdgeInsets.all(18),
                        width: double.infinity,
                        height: 160,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/search_bg.png"),
                                fit: BoxFit.cover)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:12),
                              child: Text("Search the job you're looking for",
                                  style:
                                      GoogleFonts.poppins(color: Colors.white)),
                            ),
                                    SizedBox(height: 20),
                            TextField(
                              decoration: InputDecoration(
                                  hintText: "Search",
                                  hintStyle:
                                      GoogleFonts.poppins(color: Colors.grey),
                                  prefixIcon: Icon(
                                    Icons.search_rounded,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none),
                                  contentPadding: EdgeInsets.zero,
                                  fillColor: Colors.white,
                                  filled: true),
                            ),
                          ],
                        ))
                  ],
                ))));
  }
}