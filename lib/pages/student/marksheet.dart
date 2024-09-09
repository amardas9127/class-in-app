import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon/utils/colors.dart';

class Marksheet extends StatefulWidget {
  const Marksheet({super.key});

  @override
  State<Marksheet> createState() => _MarksheetState();
}

class _MarksheetState extends State<Marksheet> {
  // Example list of semesters and their marks
  final List<Map<String, String>> _marks = [
    {'semester': 'Semester 1', 'percentage': '85%'},
    {'semester': 'Semester 2', 'percentage': '88%'},
    {'semester': 'Semester 3', 'percentage': '90%'},
    {'semester': 'Semester 4', 'percentage': '92%'},
    // Add more semesters if needed
  ];

  // Function to show snackbar when download button is clicked
  void _downloadMarksheet(String semester) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$semester Marksheet downloaded'),
      ),
    );
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
              "MARKSHEET",
              style: TextStyle(
                color: textclr,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: ListView.builder(
              itemCount: _marks.length,
              itemBuilder: (context, index) {
                String semester = _marks[index]['semester']!;
                String percentage = _marks[index]['percentage']!;
                
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
                              semester,
                              style: TextStyle(
                                color: textclr,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              percentage,
                              style: TextStyle(
                                color: textclr,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () => _downloadMarksheet(semester),
                          icon: Icon(Icons.download),
                          color: Colors.blue,
                          iconSize: 30.r,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
