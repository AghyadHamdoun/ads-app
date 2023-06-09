import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../mixins/base_mixin.dart';
import '../utils/app_colors.dart';

class ListUser extends StatelessWidget with BaseMixin {
  ListUser({
    super.key,
    required this.name,
    required this.desc,
    required this.image,
    required this.rate,
    required this.adsDuration,
    required this.adsBalance,
    required this.add,
    required this.delete,
    required this.edit,
    required this.showDeleteEdit,
    this.color,
    this.fontSize,
  });

  final String? name;
  final String? image;
  final String? desc;
  final String? rate;
  final String? adsBalance;
  final String? adsDuration;
  final VoidCallback edit,delete,add;
  final bool showDeleteEdit;
  final Color? color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Card(
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
            children: [
              Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: image ?? "http://via.placeholder.com/200x150",
                    imageBuilder: (context, imageProvider) => Container(
                      height: 100.h,
                      width: 100.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                  SizedBox(width: 12.w,),
                  Expanded(
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
                                  color: AppColor.textColor,
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
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            Icon(Icons.star,size: 29.sp,color: Colors.amber),
                            Expanded(
                              child: Text(
                                 " ($rate) ",
                                maxLines: 3,
                                style: TextStyle(
                                  color: Colors.amber,
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
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                desc??"",
                                style: TextStyle(
                                    fontSize: 13.5.sp,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.start,
                              ),
                            ),

                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${"BidAmount".tr()} : ${adsBalance!} ${"SAR".tr()}",
                                style: TextStyle(
                                    fontSize: 13.5.sp,
                                    color: AppColor.colorBlack,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.start,
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 5.h),

                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${"Duration".tr()} : ${adsDuration!} ${"Day".tr()}",
                                style: TextStyle(
                                    fontSize: 13.5.sp,
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 7.h),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 12.w,),
                  if(showDeleteEdit)
                    ...[
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.sp),
                        ),
                        color: Colors.red,
                        onPressed: delete,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 4.h, horizontal: 12.w),
                          child: Row(
                            children: [
                              Icon(Icons.delete_outlined,
                                  color: AppColor.white, size: 25.sp),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                    ],

                  if(showDeleteEdit)
                    ...[
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.sp),
                        ),
                        color: AppColor.thirdColor,
                        onPressed: edit,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 4.h, horizontal: 12.w),
                          child: Row(
                            children: [
                              Icon(Icons.edit_note_sharp,
                                  color: AppColor.white, size: 25.sp),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                    ],


                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.sp),
                    ),
                    color: AppColor.secondColor,
                    onPressed: add,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 4.h, horizontal: 12.w),
                      child: Row(
                        children: [
                          Icon(Icons.person_add_alt,
                              color: AppColor.white, size: 25.sp),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w,),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
