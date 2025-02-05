import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/strings.dart';

class CommonAppbar extends StatelessWidget {
  final String? title;
  const CommonAppbar({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title??'', style: TextStyle(

      color: Colors.white, fontSize: 18.sp,fontWeight: FontWeight.w800,
      letterSpacing: 0.8,
    ) ,),
      backgroundColor: AppColors.primaryColor,centerTitle: false,
      leadingWidth: 0.0,leading: SizedBox(width: 0,),
    );
  }
}
