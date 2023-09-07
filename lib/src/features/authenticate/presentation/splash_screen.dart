import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klinnika_doctor/src/common_widgets/style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(
            flex: 4,
          ),
          Center(child: Image.asset("assets/images/klinnika_logo.png", width: 80.w, height: 80.h,)),
          SizedBox(height: 16.h,),
          Text("Klinnika", style: splashLogoName,),
          Spacer(flex: 3,),
          Text("By", style: splashBy,),
          Text("ORBIT", style: splashTeamName,),
          Spacer(flex: 1,),

        ],
      ),
    );
  }
}
