// exam_page.dart
import 'package:flutter/material.dart';

class MePage extends StatelessWidget {
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: Text(
          'Its Me',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
