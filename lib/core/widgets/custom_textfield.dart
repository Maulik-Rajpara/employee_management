import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';


class CustomTextField extends StatelessWidget {
  final dynamic validator;
  final void Function(String? fName)? onChanged;
  final void Function(String? s)? onFieldSubmitted;
  final VoidCallback? onTap;
  final String? hintText;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final TextEditingController? textEditingController;
  final bool? isObscureText;
  final bool? isReadOnly;
  final int? maxLine;
  final int? maxLength;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const CustomTextField({super.key,required this.validator,
     this.textInputType,
     this.onChanged,this.hintText,this.focusNode,this.onFieldSubmitted,this.onTap,this.textEditingController,this.isObscureText=false,
  this.isReadOnly=false,this.suffixIcon,this.maxLine,this.maxLength,this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      style: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.formTextColor,
          fontSize: 14.sp,
          decoration: TextDecoration.none,
        fontFamily: 'Roboto',letterSpacing: 0,

      ),minLines: 1, //Normal textInputField will be displayed
      maxLines:  maxLine??1,maxLength: maxLength,
      onChanged: onChanged,focusNode: focusNode,
      keyboardType:textInputType?? TextInputType.text,
      onFieldSubmitted: (s){
        onFieldSubmitted!(s);
      },onTap: onTap,
      readOnly: isReadOnly??false,
      obscureText: isObscureText??false,
      decoration:  InputDecoration(
        counterText: "",
        contentPadding: EdgeInsets.only(
            left: 10.sp,right:6.sp,bottom: 8.sp,
            top: 8.sp
        ),
        fillColor: Colors.transparent,
        hintStyle:  TextStyle(
          color: AppColors.hintColor,
            decoration: TextDecoration.none,
            fontFamily: 'Roboto',letterSpacing: 0,fontSize: 14.sp,
          fontWeight: FontWeight.w300
        ),
        hintText: hintText??'',
        suffixIcon:suffixIcon, prefixIcon: prefixIcon,
        errorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:  const BorderSide(
                color: AppColors.redColor,
                width: 0.6,strokeAlign: 1.0
            )
        ),
        focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:  const BorderSide(
                color: AppColors.primaryColor,
                width: 0.6,strokeAlign: 1.0
            )
        ),
        focusedErrorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:  const BorderSide(
                color: AppColors.redColor,
                width: 0.6,strokeAlign: 1.0
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:  const BorderSide(
                color: AppColors.greyBorderColor,
                width: 1.0,strokeAlign: 0.5
            )
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
                color: AppColors.greyBorderColor,
                width: 1.0,strokeAlign: 0.5
            )
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
                color: AppColors.greyBorderColor,
                width: 1.0,strokeAlign: 0.5
            )
        ),
      ),
    );
  }
}
