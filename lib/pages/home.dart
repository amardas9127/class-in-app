import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:hackathon/pages/canteen/canteenHome.dart';
>>>>>>> 79b92f8d67462e94eff4f7146e5274382cb226b3
import 'package:hackathon/pages/student/student_home.dart';
import 'package:hackathon/pages/teacher/teacher_home.dart';

class Home extends StatelessWidget {
  final String Logintype;

  const Home({super.key, required this.Logintype});

  @override
  Widget build(BuildContext context) {
    if (Logintype=="Teacher") {
      return TeacherHome();
    }
    else if (Logintype =="Student") {
      return StudentHome();
    }
    else{
      return CanteenHome();
    }
  }
}



