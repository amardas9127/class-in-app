import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          // Add a Drawer with menu items
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    'Teacher Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.folder),
                  title: Text('Project'),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  leading: Icon(Icons.chat),
                  title: Text('AI-chat'),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  leading: Icon(Icons.feedback),
                  title: Text('Feedback'),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
              ],
            ),
          ),
          
          body: Stack(
            children: [
              Center(
                child: Text(
                  'Welcome, Teacher!',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              
              // Align the hamburger menu icon to the top-left
              Positioned(
                top: 60, // Adjust this value to change vertical position
                left: 10, // Adjust this value to change horizontal position
                child: Builder(
                  builder: (context) => IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer(); // Open the drawer
                    },
                    color: Colors.blue,
                    iconSize: 30, // Adjust size of the hamburger icon
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
