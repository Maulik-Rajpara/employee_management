import 'package:employee_management/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCommon{

  static void showRoleSelectionSheet(BuildContext context, Function(String) onRoleSelected) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        List<String> roles = [
          "Product Designer",
          "Flutter Developer",
          "QA Tester",
          "Product Owner"
        ];
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Container(
              //   width: 40.w,
              //   height: 4.h,
              //   decoration: BoxDecoration(
              //     color: AppColors.greyBorderColor,
              //     borderRadius: BorderRadius.circular(8.r),
              //   ),
              // ),

              ListView.separated(
                shrinkWrap: true,
                itemCount: roles.length,
                separatorBuilder: (context, index) => Divider(height: 1,
                    color: AppColors.greyBorderColor),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      onRoleSelected(roles[index]);
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                      child: Text(
                        textAlign: TextAlign.center,
                        roles[index],
                        style: TextStyle(

                            fontSize: 16.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}