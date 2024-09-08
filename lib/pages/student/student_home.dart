import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

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
            appBar: AppBar(
              leading: Builder(
                builder: (BuildContext context) => IconButton(
                  icon: Icon(Icons.menu, size: 24.sp),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
              title: Text('Student Home', style: TextStyle(fontSize: 24.sp)),
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      'Student Menu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('Item 1', style: TextStyle(fontSize: 18.sp)),
                    onTap: () {
                      // Handle menu item tap
                    },
                  ),
                  ListTile(
                    title: Text('Item 2', style: TextStyle(fontSize: 18.sp)),
                    onTap: () {
                      // Handle menu item tap
                    },
                  ),
                  // Add more menu items here
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
        });
  }
}
