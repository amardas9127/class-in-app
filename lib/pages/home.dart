import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final bool isTeacher;

  // Accepting key and isTeacher in the constructor
  const Home({super.key, required this.isTeacher});

  @override
  Widget build(BuildContext context) {
    if (isTeacher) {
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
    } else {
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
    }
  }
}
