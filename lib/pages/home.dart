import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon/pages/student/student_home.dart';
import 'package:hackathon/pages/teacher/teacher_home.dart';

class Home extends StatelessWidget {
  final bool isTeacher;

  // Accepting key and isTeacher in the constructor
  const Home({super.key, required this.isTeacher});

  @override
  Widget build(BuildContext context) {
    if (isTeacher) {
      return TeacherHome();
    } else {
      return StudentHome();
    }
  }
}



