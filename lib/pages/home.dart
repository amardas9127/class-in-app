import 'package:flutter/material.dart';
import 'package:hackathon/pages/canteen/canteenHome.dart';
import 'package:hackathon/pages/student/student_home.dart';
import 'package:hackathon/pages/teacher/teacher_home.dart';

class Home extends StatelessWidget {
  final String Logintype;

  const Home({super.key, required this.Logintype});

  @override
  Widget build(BuildContext context) {
    if (Logintype == "Teacher") {
      return TeacherHome();
    } else if (Logintype == "Student") {
      return Container();
    } else {
      return CanteenHome();
    }
  }
}
