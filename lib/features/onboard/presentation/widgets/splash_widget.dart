import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../../../../core/utils/assets.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:  MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SvgPicture.asset(AssetsPath.splashLogo,
            height: 180.sp,width: 180.sp,),

           SizedBox(height: 40.sp,),
           Text("Employees\nManagement",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.sp,
                fontWeight: FontWeight.bold,)),

        ],
      ),
    );
  }
}
