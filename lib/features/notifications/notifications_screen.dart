import 'package:ads/core/customWidgets/error_widget.dart';
import 'package:ads/core/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/customWidgets/custom_app_bar.dart';
import '../../injection.dart';
import 'bloc/notifications_bloc.dart';
import 'bloc/notifications_state.dart';
import 'dart:ui' as ui;
class NotificationsScreen extends StatefulWidget {

  const NotificationsScreen({Key? key,
   }) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
   NotificationsBloc notificationsBloc=sl<NotificationsBloc>();


  @override
  void initState() {
    notificationsBloc.add(GetNotificationsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationsBloc, NotificationsState>(
      bloc: notificationsBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(1.sw, 100.h),
            child: CustomAppbar(
              iconData: Icons.arrow_back,
              enableNotifications: false,
              tittle: "Notifications".tr(),
              voidCallback: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: state.isLoading!
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: state.notificationsModel != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40.h,
                            ),
                            for(var item in state.notificationsModel!.message!.data!)
                              Padding(
                                padding:  EdgeInsets.only(bottom: 12.0.h),
                                child: Card(
                                  color: AppColor.white,
                                  elevation: 4,
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(
                                      vertical: 12.h,
                                      horizontal: 16.w
                                    ),
                                    child: Row(
                                      textDirection: ui.TextDirection.ltr,
                                      children: [
                                        Expanded(child:
                                        Text(item.text??"",
                                          textDirection: ui.TextDirection.ltr,
                                          style: TextStyle(fontSize: 14.sp,color: AppColor.primaryColor),
                                        )),
                                        Text(item.timeAgo??"",style: TextStyle(fontSize: 12.sp,color: AppColor.unselectedIcon),),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            SizedBox(
                              height: 40.h,
                            ),
                          ],
                        )
                      : ErrorTextWidget(
                          error: 'No Data'.tr(),
                          callback: () {
                            notificationsBloc.add(GetNotificationsEvent());
                          }),
                )),
        );
      },
    );
  }


}
