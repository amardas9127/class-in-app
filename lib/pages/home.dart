import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  final bool isTeacher;

  // Accepting key and isTeacher in the constructor
  const Home({super.key, required this.isTeacher});

  @override
  Widget build(BuildContext context) {
    if (isTeacher) {
      return TeacherScreen();
    } else {
      return StudentScreen();
    }
  }
}

//Student Screen
class StudentScreen extends StatelessWidget {
  const StudentScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        builder: (BuildContext context, Widget? child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Student Home'),
            ),
            body: Center(
              child: Text(
                'Welcome, Student!',
                style: TextStyle(fontSize: 24),
              ),
            ),
          );
        });
  }
}

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        builder: (BuildContext context, Widget? child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Teacher Home'),
            ),
            body: Center(
              child: Text(
                'Welcome, Teacher!',
                style: TextStyle(fontSize: 24),
              ),
            ),
          );
        });
  }
}
