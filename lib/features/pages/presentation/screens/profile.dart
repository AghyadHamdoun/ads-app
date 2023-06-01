import 'package:ads/core/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColor.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: 0.25.sh,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    height: 0.08.sh,
                    width: 0.08.sh,
                    decoration: BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Ahmed mohsen",
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(2)),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 5.w),
                        child: Text(
                          "Bronze",
                          style:
                              TextStyle(color: AppColor.white, fontSize: 14.sp),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.chat,
                        size: 25.r,
                        color: AppColor.colorExtended,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "chats".tr(),
                        style: TextStyle(
                            color: AppColor.colorExtended, fontSize: 18.sp),
                        textAlign: TextAlign.center,
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20.r,
                        color: AppColor.colorExtended,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
