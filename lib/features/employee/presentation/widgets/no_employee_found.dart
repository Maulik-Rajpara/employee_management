import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/strings.dart';

class NoEmployeeFound extends StatelessWidget {
  const NoEmployeeFound({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AssetsPath.splashLogo,
          height: 180.sp,width: 180.sp,),
        SizedBox(height: 8.sp),
        Text(Strings.noEmpFound,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.sp,
              fontWeight: FontWeight.bold,)),
      ],
    );
  }
}
