import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/assets.dart';

class SlideLeftBackground extends StatelessWidget {
  const SlideLeftBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(right: 24.sp),
          child: SvgPicture.asset(
            AssetsPath.delIC,
          ),
        ),
      ),
    );
  }
}
