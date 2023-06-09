import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../allAds/all_ads_screen.dart';
import '../myAds/my_ads_screen.dart';
import '../postProject/post_project_screen.dart';
import '../updateProfile/update_profile_screen.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  void showLanguageDialog(BuildContext context) async {
    // show the loading dialog
    Platform.isAndroid
        ? showDialog<void>(
      // The user CANNOT close this dialog  by pressing outsite it
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text(
                  "Select Language".tr(),
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                )),
            actions: <Widget>[
              TextButton(
                  child: Text(
                    "العربية",
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                  onPressed: () async {
                    if (Localizations.localeOf(context).languageCode ==
                        'en') {
                      Navigator.of(context).pop();

                      await context.setLocale(const Locale('ar', 'SA'));
                    } else {
                      Navigator.of(context).pop();
                    }
                  }),
              TextButton(
                  child: Text(
                    "English",
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                  onPressed: () async {
                    if (Localizations.localeOf(context).languageCode ==
                        'ar') {
                      Navigator.of(context).pop();
                      await context.setLocale(const Locale('en', 'US'));
                    } else {
                      Navigator.of(context).pop();
                    }
                  })
            ],
          );
        })
        : showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Text("Select Language".tr()),
            actions: [
              CupertinoDialogAction(
                  child: const Text("العربية"),
                  onPressed: () async {
                    if (Localizations.localeOf(context).languageCode ==
                        'en') {
                      Navigator.of(context).pop();

                      await context.setLocale(const Locale('ar', 'SA'));
                    } else {
                      Navigator.of(context).pop();
                    }
                  }),
              CupertinoDialogAction(
                  child: const Text("English"),
                  onPressed: () async {
                    if (Localizations.localeOf(context).languageCode ==
                        'ar') {
                      Navigator.of(context).pop();
                      await context.setLocale(const Locale('en', 'US'));
                    } else {
                      Navigator.of(context).pop();
                    }
                  }),
            ],
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            Material(
                color: AppColor.primaryColor,
                elevation: 3,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.sp),
                  bottomRight: Radius.circular(25.sp),
                ),
                child: Padding(
                  padding:
                  EdgeInsets.only(top: 0.h, left: 12.w, right: 12.w, bottom: 6.h),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 16.w,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Drawer'.tr(),
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.white),
                                ),


                              ],
                            ),
                          ),
                          SizedBox(width: 6.w,),
                          Image.asset('assets/logo-white.png',height: 39.sp,width: 39.sp,),
                          SizedBox(width: 6.w,),


                        ],
                      ),

                    ],
                  ),
                )),
            SizedBox(height: 20.h,),
            if(true)...[
              ListTile(
                title: Text('PendingProjects'.tr(),style: TextStyle(
                    fontSize: 14.sp
                ),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context) =>  const AllAdsScreen(

                  ),));
                },
              ),
            ],
            if(true)
              ...[
                ListTile(
                  title: Text('PostProject'.tr(),style: TextStyle(
                      fontSize: 14.sp
                  ),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder:
                        (context) =>  const PostProjectScreen(
                      name: '',
                      desc: '',
                      type: 'New',
                      balance: '',
                      loc: '',
                      obj: null,
                      projectId: "",
                    ),));
                  },
                ),
                ListTile(
                  title: Text('MyProjects'.tr(),style: TextStyle(
                      fontSize: 14.sp
                  ),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const MyAdsScreen(),));

                  },
                ),
              ],

            ListTile(
              title: Text('InProgressProjects'.tr(),style: TextStyle(
                  fontSize: 14.sp
              ),),
              onTap: () {
                // Handle option 1
              },
            ),
            ListTile(
              title: Text('Completed Ads'.tr(),style: TextStyle(
                  fontSize: 14.sp
              ),),
              onTap: () {
                // Handle option 1
              },
            ),
            ListTile(
              title: Text('Notifications'.tr(),style: TextStyle(
                  fontSize: 14.sp
              ),),
              onTap: () {
                // Handle option 1
              },
            ),
            ListTile(
              title: Text('Edit Profile'.tr(),style: TextStyle(
                  fontSize: 14.sp
              ),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdateProfileScreen(),));
               },
            ),
            ListTile(
              title: Text('Contact Us'.tr(),style: TextStyle(
                  fontSize: 14.sp
              ),),
              onTap: () {
                // Handle option 1
              },
            ),
            ListTile(
              title: Text('Logout'.tr(),style: TextStyle(
                  fontSize: 14.sp
              ),),
              onTap: () {
                // Handle option 1
              },
            ),
            ListTile(
              title: Text('Change Language'.tr(),style: TextStyle(
                  fontSize: 14.sp
              ),),
              onTap: () {
                showLanguageDialog(context);
              },
            ),





          ],
        ),
      ),
    );
  }
}
