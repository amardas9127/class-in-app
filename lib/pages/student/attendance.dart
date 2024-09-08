import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon/assets/colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  const Size(430, 932),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: bgclr,
          appBar: AppBar(
            centerTitle: true,
              title: Text("Your Attendance"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularPercentIndicator(
                    radius: 150.r,
                    lineWidth: 40,
                    percent: 0.75,
                    progressColor: progressclr,
                    backgroundColor: highlightclr,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text("75%",
                    style: TextStyle(
                      fontSize: 40.sp,
                      color: textclr,
                    ),),
                    ),


                ],
              ),
            ),
          ),
        );
      }
    );
  }
}