
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:expandable/expandable.dart';

import '../mixins/base_mixin.dart';
import '../utils/app_colors.dart';


class ListAds extends StatelessWidget with BaseMixin{
  ListAds({super.key,
    required this.name,
    required this.location,
    required this.desc,
    required this.amount,
    required this.status,
    required this.object,
    required this.edit,
    required this.delete,
    this.color,
    this.fontSize,

  });

  final String? name;
  final String? status;
  final String? desc;
  final String? location;
  final String? object;
  final String? amount;
  final VoidCallback delete,edit;
  final Color? color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {

    return  ExpandableNotifier(
      child: Card(
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.sp),
        ),

        child: Container(
          // color: Colors.white,

          padding: EdgeInsets.symmetric(
              horizontal: 0.w
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 12.h,horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                children: [

                  Expanded(child:  Text(
                    name??"",
                    maxLines: 3,
                    style: TextStyle(
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.5.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,

                  ),),
                  Expanded(
                    child: Text(
                      desc??"",
                      style: TextStyle(
                          fontSize: 14.5.sp,
                          fontWeight: FontWeight.w500,
                          color:AppColor.primaryColor
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),




                ],
              ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text("Location : ${location!}",
                        style: TextStyle(
                          fontSize: 13.5.sp,
                          color: AppColor.colorBlack,
                        fontWeight: FontWeight.w600

                      ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Expanded(
                      child: Text("${"Object :".tr()} ${object!}",
                        style: TextStyle(
                          fontSize: 13.5.sp,
                          color: AppColor.primaryColor,
                        fontWeight: FontWeight.w600

                      ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text("${"Status :".tr()} ${status!}",
                        style: TextStyle(
                          fontSize: 13.5.sp,
                          color: AppColor.colorBlack,
                          fontWeight: FontWeight.w600

                      ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Expanded(
                      child: Text("${"Balance :".tr()} ${amount!} ${"SAR".tr()}",
                        style: TextStyle(
                          fontSize: 13.5.sp,
                            color: AppColor.primaryColor,
                          fontWeight: FontWeight.w600

                      ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      minWidth: 0.36.sw,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.sp),
                      ),
                      color:  Colors.red,
                      onPressed: delete,
                      child:
                      Padding(
                        padding: EdgeInsets
                            .symmetric(vertical: 4.h,horizontal: 32.w),
                        child: Row(
                          children: [
                            Icon(Icons.delete_outlined,color: AppColor.white,size: 25.sp),
                            Text('Delete'.tr(),
                              style: TextStyle(
                                  fontSize: 12.5.sp,
                                  color: AppColor.white
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.sp),
                      ),
                      color: AppColor.thirdColor,
                      onPressed: edit,
                      minWidth: 0.35.sw,
                      child:
                      Padding(
                        padding: EdgeInsets
                            .symmetric(vertical: 4.h,horizontal: 32.w),
                        child: Row(
                          children: [
                            Icon(Icons.edit_note_sharp,color: AppColor.white,size: 25.sp),
                            Text('Edit'.tr(),
                              style: TextStyle(
                                  fontSize: 12.5.sp,
                                  color: AppColor.white
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),


                SizedBox(height: 7.h),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
