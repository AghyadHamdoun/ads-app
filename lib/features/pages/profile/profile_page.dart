import 'package:ads/core/utils/app_colors.dart';
import 'package:ads/features/addAmount/add_amount_screen.dart';
import 'package:ads/features/history/history_screen.dart';
import 'package:ads/features/pages/profile/bloc/profile_bloc.dart';
import 'package:ads/features/pages/profile/bloc/profile_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/customWidgets/error_widget.dart';
import '../../updateProfile/update_profile_screen.dart';
import '../../withdrawAmount/withdraw_amount_screen.dart';

class ProfileScreen extends StatefulWidget {
  final ProfileBloc profileBloc;
  const ProfileScreen({Key? key,required this.profileBloc}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    widget.profileBloc.add(GetProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc,ProfileState>(
      bloc: widget.profileBloc,
      listener: (context, state) {

      },
      builder:
      (context, state) {
       return Scaffold(
          body:state.isLoading!
              ? const Center(
            child: CircularProgressIndicator(),
          )
              :  SingleChildScrollView(
            child:state.profileModel!=null? Column(
              children: [
                Container(
                  color: AppColor.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    children: [
                      SizedBox(height: 40.h,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 13.w,),

                          CachedNetworkImage(
                        imageUrl:state.profileModel!.message!.profile_picture?? "http://via.placeholder.com/200x150",
                        imageBuilder: (context, imageProvider) => Container(
                          height: 70.r,
                          width: 70.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.fill,
                                ),
                          ),
                        ),
                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                          SizedBox(width: 13.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                state.profileModel!.message!.firstName??"",
                                style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 17.sp,
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
                                  state.profileModel!.message!.description??"None",
                                  style:
                                  TextStyle(color: AppColor.white, fontSize: 14.sp),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star,color: Colors.amber,
                                  size: 23.sp,),
                                SizedBox(width: 3.w,),
                                Text(
                                  "(${state.profileModel!.message!.averageRating})",
                                  style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                            child: VerticalDivider(color: AppColor.white,
                                width:10.w,thickness: 1,),
                          ),
                          Expanded(
                            child: Text(
                              "${"Wallet".tr()} (${state.profileModel!.message!.balance}) ${"SAR".tr()}",
                              style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                            child: VerticalDivider(color: AppColor.white,
                              width:10.w,thickness: 1,),
                          ),
                          Expanded(
                            child: Text(
                              "${"Orders".tr()} (${state.profileModel!.message!.orderNumbers})",
                              style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 20.h,),



                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:
                              (context) => const AddAmountScreen(),));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.credit_card_outlined,
                              size: 25.r,
                              color: AppColor.colorExtended,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "AddAmount".tr(),
                              style: TextStyle(
                                  color: AppColor.colorExtended, fontSize: 18.sp),
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 25.r,
                              color: AppColor.colorExtended,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              const WithdrawAmountScreen(),));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.credit_score_sharp,
                              size: 25.r,
                              color: AppColor.colorExtended,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "MakeWithdrawlRequests".tr(),
                              style: TextStyle(
                                  color: AppColor.colorExtended, fontSize: 18.sp),
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 25.r,
                              color: AppColor.colorExtended,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h,),
                      InkWell(
                        onTap: (){},
                        child: Row(
                          children: [
                            Icon(
                              Icons.request_page_outlined,
                              size: 25.r,
                              color: AppColor.colorExtended,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "WithdrawlRequests".tr(),
                              style: TextStyle(
                                  color: AppColor.colorExtended, fontSize: 18.sp),
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 25.r,
                              color: AppColor.colorExtended,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:
                              (context) => const HistoryScreen(),));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.history,
                              size: 25.r,
                              color: AppColor.colorExtended,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "TransactionsHistory".tr(),
                              style: TextStyle(
                                  color: AppColor.colorExtended, fontSize: 18.sp),
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 25.r,
                              color: AppColor.colorExtended,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h,),
                      InkWell(
                        onTap: (){
                          Share.share('check out my website https://example.com',
                              );

                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.mobile_screen_share_outlined,
                              size: 25.r,
                              color: AppColor.colorExtended,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "TellYourFriends".tr(),
                              style: TextStyle(
                                  color: AppColor.colorExtended, fontSize: 18.sp),
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 25.r,
                              color: AppColor.colorExtended,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h,),
                      InkWell(
                        onTap: (){},
                        child: Row(
                          children: [
                            Icon(
                              Icons.support_agent,
                              size: 25.r,
                              color: AppColor.colorExtended,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "Support".tr(),
                              style: TextStyle(
                                  color: AppColor.colorExtended, fontSize: 18.sp),
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 25.r,
                              color: AppColor.colorExtended,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder:
                                  (context) => const UpdateProfileScreen(),));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit,
                              size: 25.r,
                              color: AppColor.colorExtended,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "EditProfile".tr(),
                              style: TextStyle(
                                  color: AppColor.colorExtended, fontSize: 18.sp),
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 25.r,
                              color: AppColor.colorExtended,
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ): ErrorTextWidget(
          error: 'No Data'.tr(),
           callback: () {
             widget.profileBloc.add(GetProfileEvent());
           }),
          ),
        );
      },
    );
    }
}
