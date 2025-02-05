import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class FloatingButton extends StatelessWidget {
   final VoidCallback? callback;
   const FloatingButton({super.key,required this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: 48.sp,height: 48.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: AppColors.primaryColor,
        ),
        child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
