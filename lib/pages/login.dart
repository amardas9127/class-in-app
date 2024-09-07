import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon/assets/colors.dart';
import 'package:hackathon/pages/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController logintext = TextEditingController();
  TextEditingController passwordval = TextEditingController();

  String welcomeText = "WELCOME STUDENT";
  bool isTeacher = false;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        builder: (BuildContext context, Widget? child) {
          return Scaffold(
            backgroundColor: bgclr,
            appBar: AppBar(
              backgroundColor: highlightclr,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FractionallySizedBox(
                  widthFactor: 1.0,
                  child: Container(
                    height: 150.h,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: shadowclr,
                            offset: Offset(0, 0),
                            blurRadius: 50.r,
                          ),
                        ],
                        color: highlightclr,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(150.r),
                            bottomRight: Radius.circular(150.r))),
                    child: Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          color: textclr,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.sp,
                        ),
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
                                    offset: Offset(5.r, 5.r),
                                    blurRadius: 10.r,
                                  ),
                                  BoxShadow(
                                    color: highlightclr,
                                    offset: Offset(-5.r, -5.r),
                                    blurRadius: 10.r,
                                  ),
                                ],
                              ),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    welcomeText = "WELCOME TEACHER";
                                    isTeacher = true;
                                  });
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 35.w, vertical: 11.h),
                                  backgroundColor: bgclr,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                                child: Text(
                                  'TEACHER',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    letterSpacing: 1.sp,
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
                                    offset: Offset(5.r, 5.r),
                                    blurRadius: 10.r,
                                  ),
                                  BoxShadow(
                                    color: highlightclr,
                                    offset: Offset(-5.r, -5.r),
                                    blurRadius: 10.r,
                                  ),
                                ],
                              ),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    welcomeText = "WELCOME STUDENT";
                                    isTeacher = false;
                                  });
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 35.w, vertical: 11.h),
                                  backgroundColor: bgclr,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                                child: Text(
                                  'STUDENT',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    letterSpacing: 1.sp,
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
                            TextField(
                              controller: logintext,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: borderblacklight,
                                        width:
                                            2.0.w), // Border color when enabled
                                    borderRadius: BorderRadius.circular(8.0.r),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: borderblacklight,
                                        width:
                                            2.0.w), // Border color when focused
                                    borderRadius: BorderRadius.circular(8.0.r),
                                  ),
                                  hintText: "Enter Your ID"),
                            ),
                            TextField(
                              controller: passwordval,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: borderblacklight,
                                        width:
                                            2.0.w), // Border color when enabled
                                    borderRadius: BorderRadius.circular(8.0.r),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: borderblacklight,
                                        width:
                                            2.0.w), // Border color when focused
                                    borderRadius: BorderRadius.circular(8.0.r),
                                  ),
                                  hintText: "Enter Your Password"),
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
                                  // Navigate to home.dart and pass the value of isTeacher and key
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home(
                                        key: UniqueKey(),
                                        isTeacher: isTeacher,
                                      ),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30.w, vertical: 13.h),
                                  backgroundColor: bgclr,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
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
          );
        });
  }
}
