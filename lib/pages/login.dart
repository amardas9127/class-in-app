import 'dart:convert';
import 'package:hackathon/pages/student/student_home.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon/utils/colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController logintext = TextEditingController();
  TextEditingController passwordval = TextEditingController();

  String welcomeText = "STUDENT LOGIN";
  var Logintext = "Student";
  bool isTeacherSelected = false;
  bool isStudentSelected = true;
  bool isCantenSelected = false;

  btnclick() {
    if (isTeacherSelected) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => StudentHome(
            name: 'Name',
            rollNum: 'Roll No',
            schoolName: 'School Name',
            sclassNam: 'Class Name',
            sdept: 'Dept Name',
            semail: 'Student Email',
            sphno: 'Student Phone no',
          ),
        ),
      );
    }
    if (isStudentSelected) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => StudentHome(
            name: 'Name',
            rollNum: 'Roll No',
            schoolName: 'School Name',
            sclassNam: 'Class Name',
            sdept: 'Dept Name',
            semail: 'Student Email',
            sphno: 'Student Phone no',
          ),
        ),
      );
      // _getLoginResponse(logintext.text, passwordval.text);
    }
    if (isCantenSelected) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => StudentHome(
            name: 'Name',
            rollNum: 'Roll No',
            schoolName: 'School Name',
            sclassNam: 'Class Name',
            sdept: 'Dept Name',
            semail: 'Student Email',
            sphno: 'Student Phone no',
          ),
        ),
      );
    }
  }

  Future<String> _getLoginResponse(String userid, String userpassword) async {
    try {
      final response = await http.post(
        Uri.parse('/StudentLogin'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'rollNum': userid,
          'studentName': userpassword,
        }),
      );
      print(response.body);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Check if the response indicates success
        if (data['success']) {
          // Handle successful login
          print("Login successful: ${data['message']}");
          print("Student details: ${data['student']}");

          // Navigate to StudentHome if login is successful
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => StudentHome(
                name: data['student']['name'] ?? 'Unknown',
                rollNum: data['student']['rollNum'] ?? 'N/A',
                schoolName: data['student']['schoolName'] ?? 'Unknown',
                sclassNam: data['student']['sclassNam'] ?? 'Unknown',
                sdept: data['student']['sdept'] ?? 'Unknown',
                semail: data['student']['semail'] ?? 'Unknown',
                sphno: data['student']['sphno'] ?? 'Unknown',
              ),
            ),
          );

          return data['message']; // Return success message
        } else {
          // Handle cases where success is false, but status is 200
          return "Login failed: ${data['message']}";
        }
      } else if (response.statusCode == 401 || response.statusCode == 404) {
        // Handle unauthorized or not found status
        final data = jsonDecode(response.body);
        return "Error: ${data['message']}";
      } else {
        // Handle unexpected status codes
        return "Error: Server returned status code ${response.statusCode}";
      }
    } catch (e) {
      return "Error: ${e.toString()}";
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
            body: SafeArea(
              child: SingleChildScrollView
              (child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  SizedBox(
                    height: 150.h,
                    child: Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          color: textclr,
                          fontSize: 70.sp,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.sp,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 350.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: shadowclr,
                                      offset: Offset(3.r, 3.r),
                                      blurRadius: 6.r,
                                    ),
                                    BoxShadow(
                                      color: highlightclr,
                                      offset: Offset(-3.r, -3.r),
                                      blurRadius: 6.r,
                                    ),
                                  ],
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      welcomeText = "TEACHER LOGIN";
                                      Logintext = "Teacher";
                                      isTeacherSelected = true;
                                      isStudentSelected = false;
                                      isCantenSelected = false;
                                    });
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 20.h),
                                    backgroundColor:
                                        isTeacherSelected ? selectclr : bgclr,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    overlayColor: selectclr,
                                  ),
                                  child: Text(
                                    'TEACHER',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      letterSpacing: 1.sp,
                                      fontWeight: FontWeight.bold,
                                      color: textclr,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: shadowclr,
                                      offset: Offset(3.r, 3.r),
                                      blurRadius: 6.r,
                                    ),
                                    BoxShadow(
                                      color: highlightclr,
                                      offset: Offset(-3.r, -3.r),
                                      blurRadius: 6.r,
                                    ),
                                  ],
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      welcomeText = "STUDENT LOGIN";
                                      Logintext = "Student";
                                      isTeacherSelected = false;
                                      isCantenSelected = false;
                                      isStudentSelected = true;
                                    });
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 20.h),
                                    backgroundColor:
                                        isStudentSelected ? selectclr : bgclr,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    overlayColor: selectclr,
                                  ),
                                  child: Text(
                                    'STUDENT',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      letterSpacing: 1.sp,
                                      fontWeight: FontWeight.bold,
                                      color: textclr,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: shadowclr,
                                      offset: Offset(3.r, 3.r),
                                      blurRadius: 6.r,
                                    ),
                                    BoxShadow(
                                      color: highlightclr,
                                      offset: Offset(-3.r, -3.r),
                                      blurRadius: 6.r,
                                    ),
                                  ],
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      welcomeText = "CANTEEN LOGIN";
                                      Logintext = "Canteen";
                                      isTeacherSelected = false;
                                      isCantenSelected = true;
                                      isStudentSelected = false;
                                    });
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 20.h),
                                    backgroundColor:
                                        isCantenSelected ? selectclr : bgclr,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    overlayColor: selectclr,
                                  ),
                                  child: Text(
                                    'CANTEEN',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      letterSpacing: 1.sp,
                                      fontWeight: FontWeight.bold,
                                      color: textclr,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Container(
                          height: 430.h,
                          width: 350.w,
                          padding: EdgeInsets.all(20.w),
                          decoration: BoxDecoration(
                            color: bgclr,
                            borderRadius: BorderRadius.circular(16.r),
                            boxShadow: [
                              BoxShadow(
                                color: shadowclr,
                                offset: Offset(10.r, 10.r),
                                blurRadius: 20.r,
                              ),
                              BoxShadow(
                                color: highlightclr,
                                offset: Offset(-10.r, -10.r),
                                blurRadius: 20.r,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                welcomeText,
                                style: TextStyle(
                                  color: textclr,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.sp,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: shadowclr,
                                          offset: Offset(4.r, 4.r),
                                          blurRadius: 8.r,
                                          inset: true),
                                      BoxShadow(
                                          color: highlightclr,
                                          offset: Offset(-4.r, -4.r),
                                          blurRadius: 8.r,
                                          inset: true),
                                    ],
                                    borderRadius: BorderRadius.circular(15.0.r),
                                    color:
                                        bgclr // Match the TextField borderRadius
                                    ),
                                child: TextField(
                                  controller: logintext,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: bgclr,
                                            width: 2.0
                                                .w), // Border color when enabled
                                        borderRadius:
                                            BorderRadius.circular(8.0.r),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: bgclr,
                                            width: 2.0
                                                .w), // Border color when focused
                                        borderRadius:
                                            BorderRadius.circular(8.0.r),
                                      ),
                                      hintText: "Enter Your ID"),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: shadowclr,
                                          offset: Offset(4.r, 4.r),
                                          blurRadius: 8.r,
                                          inset: true),
                                      BoxShadow(
                                          color: highlightclr,
                                          offset: Offset(-4.r, -4.r),
                                          blurRadius: 8.r,
                                          inset: true),
                                    ],
                                    borderRadius: BorderRadius.circular(15.0.r),
                                    color:
                                        bgclr // Match the TextField borderRadius
                                    ),
                                child: TextField(
                                  controller: passwordval,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: bgclr,
                                            width: 2.0
                                                .w), // Border color when enabled
                                        borderRadius:
                                            BorderRadius.circular(8.0.r),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: bgclr,
                                            width: 2.0
                                                .w), // Border color when focused
                                        borderRadius:
                                            BorderRadius.circular(8.0.r),
                                      ),
                                      hintText: "Enter Your Password"),
                                ),
                              ),
                              Container(
                                width: 330.w,
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
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    btnclick();
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30.w, vertical: 13.h),
                                    backgroundColor: bgclr,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    overlayColor: selectclr,
                                  ),
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      color: textclr,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 70.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),),
          );
        });
  }
}
