

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';


class ErrorTextWidget extends StatelessWidget {

  final String error;
  final Color? color;
  final String? buttonName;
  final VoidCallback callback;
  const ErrorTextWidget({Key? key,
      required this.error,
     required this.callback,
     this.buttonName,
    this.color =AppColor.colorBlack,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(
        height: 0.75.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              child: Text(
                error,

                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            MaterialButton(
              color: AppColor.primaryColor,
              onPressed: callback,
             child: Text(buttonName??'Refresh'.tr(),style: TextStyle(
               color: AppColor.white,
               fontSize:14.sp,

             )),
            ),
          ],
        ),
      ),
    );;
  }
}
