import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class SecondaryButton extends StatelessWidget {
  final String? label;
  final VoidCallback? callback;
  final bool? smallButton;
  const SecondaryButton({super.key, required this.label,
    required this.callback,this.smallButton=false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: smallButton!?64.sp: 75.sp,height: smallButton!?34.sp: 40.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: AppColors.lightSkyColor,
        ),
        child: Center(
          child: Text(label??"",style: TextStyle(
              color: AppColors.primaryColor,fontSize: smallButton!?12.sp: 16.sp,
              fontWeight: FontWeight.w500
          ),),
        ),
      ),
    );
  }
}
