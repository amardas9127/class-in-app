import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon/utils/colors.dart';
import 'package:file_picker/file_picker.dart';

class Assignments extends StatefulWidget {
  const Assignments({super.key});

  @override
  State<Assignments> createState() => _AssignmentsState();
}

class _AssignmentsState extends State<Assignments> {
  // Example list of assignments
  final List<Map<String, String>> _assignments = [
    {'name': 'Assignment 1', 'marks': '85', 'date': '20/08/2024'},
    {'name': 'Assignment 2', 'marks': '90', 'date': '22/08/2024'},
  ];

  // Function to show snackbar when download button is clicked
  void _downloadAssignment(String assignmentName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Download $assignmentName'),
      ),
    );
  }

  // Function to pick a file using file picker and add to the list
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      String fileName = result.files.single.name;
      String currentDate = DateTime.now().toString().substring(0, 10);

      setState(() {
        _assignments.add({
          'name': fileName.length > 24 ? fileName.substring(0, 24) : fileName,
          'marks': '---',
          'date': currentDate.replaceAll('-', '/'), // Convert date format
        });
      });

      // Show snackbar indicating file has been added
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('File "$fileName" added to assignments'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: bgclr,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: bgclr,
            title: Text(
              "ASSIGNMENTS",
              style: TextStyle(
                color: textclr,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: SingleChildScrollView(
              child: Column(
                children: _assignments.map((assignment) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0.h),
                    child: Container(
                      padding: EdgeInsets.all(16.0.w),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: shadowclr,
                            offset: Offset(8.r, 8.r),
                            blurRadius: 16.r,
                          ),
                          BoxShadow(
                            color: highlightclr,
                            offset: Offset(-8.r, -8.r),
                            blurRadius: 16.r,
                          ),
                        ],
                        color: bgclr,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                assignment['name']!,
                                style: TextStyle(
                                  color: textclr,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                'Marks: ${assignment['marks']}',
                                style: TextStyle(
                                  color: textclr,
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                'Date: ${assignment['date']}',
                                style: TextStyle(
                                  color: textclr,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () =>
                                _downloadAssignment(assignment['name']!),
                            icon: Icon(Icons.download),
                            color: lightblue,
                            iconSize: 30.r,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _pickFile,
            backgroundColor: lightblue,
            child: Icon(Icons.upload_file,
            color: bgclr,
            size: 35.sp,
            ),
          ),
        );
      },
    );
  }
}
