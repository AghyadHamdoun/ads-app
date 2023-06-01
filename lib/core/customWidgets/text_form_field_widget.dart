import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';


class TextFormFieldWidget extends StatelessWidget {
  //
  const TextFormFieldWidget(
      {super.key,
      this.controller,
      this.hintText,
      this.hintColor,
      this.helpText,
      this.prefixIcon,
      this.suffix,
      this.isPassword,
      this.enabled,
      this.readOnly,
      this.borderColor,
      this.textColor,
      this.isDense,
      this.labelText,
      this.labelColor,
      this.focusBorderColor,
      this.toggleObscured,
      this.textInputType,
      this.regExp,
      this.maxLength,
      this.onChange,
      this.suffixIcon,
      this.suffixCallBack,
        this.maxLines,
      this.pad
      });

  final TextEditingController? controller;
  final String? hintText, helpText, labelText;
  final IconData? prefixIcon, suffixIcon;
  final bool? suffix;
  final bool? isPassword, enabled, readOnly, isDense;
  final Color? borderColor, focusBorderColor;
  final Color? textColor, hintColor, labelColor;
  final VoidCallback? toggleObscured, suffixCallBack;
  final TextInputType? textInputType;
  final RegExp? regExp;
  final double? pad;
  final int? maxLength;
  final int? maxLines;
  final ValueChanged<String>? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:pad?? 20.w),
      child: TextFormField(
        onChanged: onChange,
        controller: controller,
        maxLength: maxLength,
        maxLines: maxLines,
        inputFormatters: <TextInputFormatter>[
          if (textInputType != null && textInputType == TextInputType.number)
            FilteringTextInputFormatter.digitsOnly
        ],
        keyboardType: textInputType ?? TextInputType.text,
        readOnly: readOnly ?? false,
        obscureText: isPassword ?? false,
        style:
            TextStyle(color: textColor ?? AppColor.colorBlack, fontSize: 14.sp),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          isDense: isDense,

          counterStyle: TextStyle(
              color: hintColor ?? AppColor.colorGrey, fontSize: 11.sp),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0.w),
            borderSide: BorderSide(
              color: focusBorderColor ?? AppColor.primaryColor,
              width: 1.0.h,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0.w),
            borderSide: BorderSide(
              color: Colors.grey.shade600,
              width: 1.0.h,
            ),
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0.w),
              borderSide: BorderSide(
                  width: 1, color: borderColor ?? AppColor.colorBlack)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0.w),
            borderSide: BorderSide(
              color: borderColor ?? AppColor.colorBlack,
              width: 1.0.h,
            ),
          ),
          hintText: hintText ?? '',

          hintStyle: TextStyle(
              color: hintColor ?? AppColor.colorBlack, fontSize: 14.sp),
          helperText: helpText ?? '',
          prefixIcon: null == prefixIcon
              ? null
              : Icon(
                  prefixIcon,
                  size: 19.sp,
                ),
          suffix: null == suffix
              ? null
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: GestureDetector(
                    onTap: toggleObscured,
                    child: Icon(
                      isPassword ?? false
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                      size: 18.w,
                      color: AppColor.colorBlack,
                    ),
                  ),
                ),
          suffixIcon: null == suffixIcon
              ? null
              : controller != null && controller!.text.isNotEmpty
                  ? GestureDetector(
                      onTap: suffixCallBack,
                      child: Padding(
                        padding: EdgeInsets.all(10.sp),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child: Padding(
                                padding: EdgeInsets.all(0.sp),
                                child: Icon(
                                  suffixIcon,
                                  size: 16.sp,
                                  color: Colors.white,
                                )),
                          ),
                      ),
                    )
                  : const SizedBox(),
          enabled: enabled ?? true,
          labelText: labelText,
          labelStyle: TextStyle(
            color: labelColor ?? AppColor.colorGrey,
          ),
        ),
      ),
    );
  }
}
