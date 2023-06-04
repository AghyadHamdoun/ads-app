import 'package:ads/core/customWidgets/error_widget.dart';
import 'package:ads/core/utils/app_colors.dart';
import 'package:ads/features/pages/home/bloc/home_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/customWidgets/custom_app_bar.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  final HomeBloc homeBloc;
  final VoidCallback voidCallback;

  const HomePage({Key? key, required this.homeBloc,
    required this.voidCallback}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  @override
  void initState() {
    widget.homeBloc.add(GetDashboardDetailsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: widget.homeBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(1.sw, 100.h),
            child: CustomAppbar(
              iconData: Icons.menu,
              tittle: "Home".tr(),
              voidCallback: () {
                widget.voidCallback();
                //Navigator.pop(context);
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
                  child: state.dashboardModel != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 60.h,
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              alignment: WrapAlignment.center,
                              children: [
                                for (int i = 0; i < 6; i++)
                                  Container(
                                    width: 0.45.sw,
                                    height: 100.h,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(
                                            color: AppColor.unselectedIcon)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.w, vertical: 8.h),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  i == 0
                                                      ? state
                                                              .dashboardModel!
                                                              .message!
                                                              .balance ??
                                                          "0"
                                                      : i == 1
                                                          ? state
                                                              .dashboardModel!
                                                              .message!
                                                              .totalProjects
                                                              .toString()
                                                          : i == 2
                                                              ? state
                                                                  .dashboardModel!
                                                                  .message!
                                                                  .inProgress
                                                                  .toString()
                                                              : i == 3
                                                                  ? state
                                                                      .dashboardModel!
                                                                      .message!
                                                                      .completed
                                                                      .toString()
                                                                  : i == 4
                                                                      ? state
                                                                          .dashboardModel!
                                                                          .message!
                                                                          .activeMilestones
                                                                          .toString()
                                                                      : state
                                                                          .dashboardModel!
                                                                          .message!
                                                                          .totalMilestones
                                                                          .toString(),
                                                  style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        AppColor.primaryColor,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  i == 0
                                                      ? "Current Balance".tr()
                                                      : i == 1
                                                          ? "Total Ads".tr()
                                                          : i == 2
                                                              ? "In Progress Ads"
                                                                  .tr()
                                                              : i == 3
                                                                  ? "Completed Ads"
                                                                      .tr()
                                                                  : i == 4
                                                                      ? "Active Milestones"
                                                                          .tr()
                                                                      : "Total Milestones"
                                                                          .tr(),
                                                  style: TextStyle(
                                                    fontSize: 13.5.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColor.colorBlack,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                              ],
                            )
                          ],
                        )
                      : ErrorTextWidget(
                          error: 'No Data'.tr(),
                          callback: () {
                            widget.homeBloc.add(GetDashboardDetailsEvent());
                          }),
                )),
        );
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
