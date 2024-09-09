import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon/utils/colors.dart';
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
        designSize: const Size(430, 932),
        minTextAdapt: true,
        builder: (BuildContext context, Widget? child) {
          return Scaffold(
            backgroundColor: bgclr,
            appBar: AppBar(
              centerTitle: true,
              foregroundColor: textclr,
              backgroundColor: bgclr,
              title: Text(
                "ATTANDANCE",
                style: TextStyle(
                  color: textclr,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularPercentIndicator(
                          animation: true,
                          radius: 100.r,
                          lineWidth: 30,
                          percent: 0.75,
                          progressColor: progressclr,
                          backgroundColor: highlightclr,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "75",
                                style: TextStyle(
                                    fontSize: 45.sp,
                                    color: progressclr,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "%",
                                style: TextStyle(
                                  fontSize: 40.sp,
                                  color: progressclr,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "TOTAL",
                              style: TextStyle(
                                  color: textclr,
                                  fontSize: 57.sp,
                                  letterSpacing: 1.sp),
                            ),
                            Text(
                              "ATTANDANCE",
                              style: TextStyle(
                                  color: textclr,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.sp,
                                  letterSpacing: 1.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 380.w,
                      height: 450.h,
                      decoration: BoxDecoration(
                        color: bgclr,
                        borderRadius: BorderRadius.circular(20.r),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          monthlystatus(89, "JAN"),
                          monthlystatus(74, "FEB"),
                          monthlystatus(20, "MAR"),
                          monthlystatus(60, "APR"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Column monthlystatus(int percentage, String month) {
    Color barcolor;
    if (percentage >= 75) {
      barcolor = Colors.green[300]!;
    } else if (percentage < 75 && percentage >= 60) {
      barcolor = Colors.yellow[300]!;
    } else if (percentage < 60 && percentage > 40) {
      barcolor = Colors.orange[300]!;
    } else {
      barcolor = Colors.red[300]!;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '${percentage.toStringAsFixed(1)}%',
          style: TextStyle(
            color: textclr,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: percentage * 3.5.h,
          width: 60.w,
          decoration: BoxDecoration(
            boxShadow: [
            BoxShadow(
              color: shadowclr,
              offset: Offset(0.r, 5.r),
              blurRadius: 2.r,
            ),
          ], color: barcolor, borderRadius: BorderRadius.circular(12.r)),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          month,
          style: TextStyle(
            color: textclr,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }
}
