// exam_page.dart
import 'package:flutter/material.dart';

class ResourcePage extends StatelessWidget {
  const ResourcePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: Text(
          'Resources',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
