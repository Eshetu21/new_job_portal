import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_app/utilities/app_color.dart' as appColors;

class JobTab extends StatefulWidget {
  const JobTab({super.key});

  @override
  State<JobTab> createState() => _JobTabState();
}

List _jobTab = ["All", "Recent", "Featured"];
var selectedTab = 0;

class _JobTabState extends State<JobTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      height: 30,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: selectedTab == index
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                      border: Border.all(
                        color: selectedTab == index
                            ? Color(0xFF0D0140)
                            : appColors.primaryColor.withOpacity(0.2),)),
                padding: EdgeInsets.symmetric(horizontal: 38),
                child: Center(
                  child: Text(_jobTab[index],
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: selectedTab == index
                              ? FontWeight.w500
                              : FontWeight.w300)),
                ),
              ),
            );
          },
          separatorBuilder: (_, index) {
            return SizedBox(width: 10);
          },
          itemCount: _jobTab.length),
    );
  }
}
