// exam_page.dart
import 'package:flutter/material.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: Text(
          'Exam Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
