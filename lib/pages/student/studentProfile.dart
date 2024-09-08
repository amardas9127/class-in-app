import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon/utils/colors.dart';

class Studentprofile extends StatefulWidget {
  const Studentprofile({super.key});

  @override
  State<Studentprofile> createState() => _StudentprofileState();
}

class _StudentprofileState extends State<Studentprofile> {
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
                "PROFILE",
                style: TextStyle(
                  color: textclr,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment(0, -.5),
                    children:[ Container(
                      width: 300.r,
                      height: 300.r,
                      decoration: BoxDecoration(
                        color: bgclr,
                        borderRadius: BorderRadius.circular(150.r),
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
                      image: AssetImage("assets/man.png"),
                      height: 280.r,
                      width: 280.r,
                      )
                    ]
                  ),
                  Container(
                    width: 350.w,
                    height: 450.h,
                    decoration: BoxDecoration(
                      color: bgclr,
                      borderRadius: BorderRadius.circular(10.r),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Detailscard("Name", "Amar Das"),
                        Detailscard("Roll No", "BCASP/038"),
                        Detailscard("Department", "BCA"),
                        Detailscard("Semester", "5th"),
                        Detailscard("Ph No", "9876543210"),
                        Detailscard("E-mail", "amardas@gmail.com"),
                        ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Row Detailscard(String dtitle, String details) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 40.w,
        ),
        Text(
          "$dtitle :",
          style: TextStyle(color: textclr, fontSize: 20.sp,),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          details,
          style: TextStyle(color: textclr, fontSize: 20.sp),
        )
      ],
    );
  }
}
