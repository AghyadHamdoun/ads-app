import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:expandable/expandable.dart';

import '../mixins/base_mixin.dart';
import '../utils/app_colors.dart';

class ListAllAds extends StatelessWidget with BaseMixin {
  ListAllAds({
    super.key,
    required this.name,
    required this.location,
    required this.desc,
    required this.amount,
    required this.status,
    required this.object,
    required this.showDetails,
    this.color,
    this.fontSize,
  });

  final String? name;
  final String? status;
  final String? desc;
  final String? location;
  final String? object;
  final String? amount;
  final VoidCallback? showDetails;
  final Color? color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Card(
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.sp),
        ),
        child: Container(
          // color: Colors.white,

          padding: EdgeInsets.symmetric(horizontal: 0.w),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name ?? "",
                        maxLines: 3,
                        style: TextStyle(
                          color: AppColor.colorBlack,
                          fontWeight: FontWeight.w600,
                          fontSize: 13.5.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        desc ?? "",
                        style: TextStyle(
                            fontSize: 14.5.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.textColor),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "${"Location".tr()} : ${location!}",
                        style: TextStyle(
                          fontSize: 13.5.sp,
                          color: AppColor.colorBlack,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "${"Objective".tr()} : ${object!}",
                        style: TextStyle(
                          fontSize: 13.5.sp,
                          color: AppColor.colorOccupied,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${"Amount".tr()} : ${amount!} ${"SAR".tr()}",
                        style: TextStyle(
                          fontSize: 13.5.sp,
                          color: AppColor.primaryColor,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                if (showDetails != null) ...[
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.sp),
                        ),
                        color: AppColor.thirdColor,
                        onPressed: showDetails,
                        minWidth: 0.65.sw,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 4.h, horizontal: 32.w),
                          child: Row(
                            children: [
                              Icon(Icons.description_outlined,
                                  color: AppColor.white, size: 25.sp),
                              Text(
                                'ViewDetails'.tr(),
                                style: TextStyle(
                                    fontSize: 12.5.sp, color: AppColor.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                SizedBox(height: 7.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
