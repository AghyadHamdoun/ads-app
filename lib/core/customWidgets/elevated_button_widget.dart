
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElevatedButtonWidget extends StatelessWidget {

   const ElevatedButtonWidget({Key? key,
    this.onPressed,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled=true,
    this.text,
    this.borderColor = Colors.transparent,
    this.textColor,
    this.bgColor,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? enabled;
  final String? text;
  final Color borderColor;
  final Color? textColor;
  final Color? bgColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor:enabled!? MaterialStateProperty.all(bgColor):MaterialStateProperty.all(Colors.grey),
          foregroundColor: MaterialStateProperty.all(textColor),
          padding: MaterialStateProperty.all(EdgeInsets.all(13.sp)),//padding
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0.sp),
                  side: BorderSide(color: borderColor,)
                )
            )
        ),
        child: Text(text!.toUpperCase(),
        style: TextStyle(
          fontSize: 13.5.sp
        ),
          textAlign: TextAlign.center,
        ),


        ),
      );
  }
}