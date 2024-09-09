// ignore: file_names
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon/utils/colors.dart';

class Studentfeedback extends StatefulWidget {
  const Studentfeedback({super.key});

  @override
  State<Studentfeedback> createState() => _StudentfeedbackState();
}

class _StudentfeedbackState extends State<Studentfeedback> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        builder: (BuildContext context, Widget? child) {
          return Scaffold(
            backgroundColor: bgclr,
            appBar: AppBar(
              backgroundColor: bgclr,
              centerTitle: true,
              title: Text(
                "FEEDBACK",
                style: TextStyle(
                  color: textclr,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(alignment: Alignment(0, 0), children: [
                          Container(
                            height: 350.r,
                            width: 350.r,
                            decoration: BoxDecoration(
                              color: bgclr,
                              borderRadius: BorderRadius.circular(170.r),
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
                          ),
                          Image(
                            image: AssetImage("assets/image.png"),
                            height: 300.r,
                          ),
                        ]),
                        SizedBox(
                          height: 10.r,
                        ),
                        Text(
                          "Your Feedback Makes Us Better",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: textclr,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
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
                              color: bgclr // Match the TextField borderRadius
                              ),
                          child: TextField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: bgclr,
                                      width:
                                          2.0.w), // Border color when enabled
                                  borderRadius: BorderRadius.circular(8.0.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: bgclr,
                                      width:
                                          2.0.w), // Border color when focused
                                  borderRadius: BorderRadius.circular(8.0.r),
                                ),
                                hintText: "Enter Your Feedback Here"),
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  height: 3.h
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: 390.w,
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
                            onPressed: () {},
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
                              'SUBMIT',
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: textclr,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
