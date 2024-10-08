import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon/pages/student/assignments.dart';
import 'package:hackathon/pages/student/studentProfile.dart';
import 'package:hackathon/utils/colors.dart'; // Assuming your custom color imports
import 'package:hackathon/pages/student/AiChat.dart';
import 'package:hackathon/pages/student/Attendance.dart';
import 'package:hackathon/pages/student/Marksheet.dart';
import 'package:hackathon/pages/student/studentFeedback.dart';

class StudentHome extends StatefulWidget {
  final String name;
  final String rollNum;
  final String schoolName;
  final String sclassNam;
  final String sdept;
  final String semail;
  final String sphno;

  const StudentHome({
    super.key,
    required this.name,
    required this.rollNum,
    required this.schoolName,
    required this.sclassNam,
    required this.sdept,
    required this.semail,
    required this.sphno,
  });

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: bgclr,
          appBar: AppBar(
            backgroundColor: bgclr,
            leading: Builder(
              builder: (BuildContext context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 30.sp,
                  color: lightblue,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Open the drawer
                },
              ),
            ),
            actions: [
              IconButton(
                padding: EdgeInsets.only(right: 5.r),
                  icon: Icon(
                    Icons.notifications,
                    size: 30.sp,
                    color: lightblue,
                  ),
                  onPressed: () {}),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: lightblue,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.person,
                          size: 100.sp,
                          color: bgclr,
                        ),
                        Text(
                          widget.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _buildDrawerItem(Icons.chat, 'AI Chat', context, AiChat()),
                _buildDrawerItem(
                    Icons.book, 'Assignments', context, Assignments()),
                _buildDrawerItem(
                    Icons.bar_chart, 'Attendance', context, Attendance()),
                _buildDrawerItem(
                    Icons.feedback, 'Feedback', context, Studentfeedback()),
                _buildDrawerItem(
                    Icons.numbers, 'Marksheet', context, Marksheet()),
                _buildDrawerItem(Icons.person, 'Me', context, Scaffold() ),
              ],
            ),
          ),
          body: Center(
            child: Text(
              'Welcome, Student!',
              style: TextStyle(fontSize: 24.sp),
            ),
          ),
        );
      },
    );
  }

  // Helper method to create a drawer item with navigation
  Widget _buildDrawerItem(
      IconData icon, String title, BuildContext context, Widget screen) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30.sp,
        color: lightblue,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 18.sp),
      ),
      onTap: () {
      // Close the drawer when a menu item is tapped
      Navigator.pop(context);

      // Check if the selected item is 'Me', and use Navigator.pushReplacement
      if (title == 'Me') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Studentprofile(
              name: widget.name,
              rollNum: widget.rollNum,
              schoolName: widget.schoolName,
              sclassNam: widget.sclassNam,
              sdept: widget.sdept,
              semail: widget.semail,
              sphno: widget.sphno,
            ),
          ),
        );
      } else {
        // For other items, use regular push navigation
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      }
    },
    );
  }
}
