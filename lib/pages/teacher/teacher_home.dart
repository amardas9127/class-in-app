import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon/pages/teacher/exam_page.dart';
import 'package:hackathon/utils/colors.dart';
import 'attendance.dart'; // Import the new pages
import 'project_page.dart';
import 'Me.dart';
import 'resource.dart';

class TeacherHome extends StatefulWidget {
  const TeacherHome({super.key});

  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: bgclr,
          appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 30.sp,
                  color: background_blue,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Open the drawer
                },
              ),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
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
                          'Hello World',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _buildDrawerItem(
                    Icons.bar_chart, 'Attendance', context, AttendancePage()),
                _buildDrawerItem(
                    Icons.book, 'Projects', context, ProjectPage()),

                _buildDrawerItem(Icons.feedback, 'Exam', context, ExamPage()),
                _buildDrawerItem(
                    Icons.laptop, 'Resources', context, ResourcePage()),
                //_buildDrawerItem(Icons.numbers, 'Marksheet', context, Marksheet()),
                _buildDrawerItem(Icons.person, 'Me', context, MePage()),
              ],
            ),
          ),
          body: Center(
            child: Text(
              'Welcome, Teacher!',
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
        color: background_blue,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 18.sp),
      ),
      onTap: () {
        // Close the drawer when a menu item is tapped
        Navigator.pop(context);
        // Navigate to the specified screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}
