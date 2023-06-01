import 'dart:io';
import 'package:ads/core/mixins/base_mixin.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ads/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/app_colors.dart';
import 'bloc/pages_bloc.dart';
import 'bloc/pages_state.dart';

class PagesPage extends StatefulWidget {
  const PagesPage({Key? key}) : super(key: key);

  @override
  _PagesPageState createState() => _PagesPageState();
}

class _PagesPageState extends State<PagesPage> with BaseMixin {
  late PageController pageController;
  late PagesBloc pagesBloc;

  @override
  void initState() {
    pageController = PageController();
    pagesBloc = sl<PagesBloc>();
    pagesBloc.add(ChangePageEvent(page: 0));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PagesBloc, PagesState>(
      bloc: pagesBloc,
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            if (state.page != 0) {
              pagesBloc.add(ChangePageEvent(page: 0));
              pageController.jumpToPage(0);
            } else {
              showAlertDialog(
                context: context,
                title: "exit".tr(),
                msg: "are you sure?".tr(),
                positivePressed: () {
                  exit(0);
                },
                negativePressed: () {
                  Navigator.pop(context);
                },
                cancelable: true,
                negativeBtn: "no".tr(),
                positiveBtn: "yes".tr(),
              );
            }
            return false;
          },
          child: Scaffold(
            body: PageView(
              onPageChanged: (value) {
                pagesBloc.add(ChangePageEvent(page: value));
              },
              controller: pageController,
              children: [
                SizedBox(),
                SizedBox(),
                SizedBox(),
                SizedBox(),
              ],
            ),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                // sets the background color of the `BottomNavigationBar`
                canvasColor: AppColor.colorBlack,
              ),
              child: BottomNavigationBar(
                  type: BottomNavigationBarType.shifting,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: const ImageIcon(
                        AssetImage(
                          "assets/home.png",
                        ),
                        // color: Colors.black,
                      ),
                      label: "Home".tr(),
                    ),
                    BottomNavigationBarItem(
                      icon: const ImageIcon(
                        AssetImage("assets/call.png"),
                        // color: Colors.black,
                      ),
                      label: "Call Us".tr(),
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: Colors.black,
                      icon: const ImageIcon(
                        AssetImage("assets/chat.png"),
                        // color: Colors.black,
                      ),
                      label: "Chat".tr(),
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: Colors.black,
                      icon: const ImageIcon(
                        AssetImage("assets/profile.png"),
                        // color: Colors.black,
                      ),
                      label: "Profile".tr(),
                    ),
                  ],
                  iconSize: 20.w,
                  selectedLabelStyle: TextStyle(
                    fontSize: 12.sp,
                  ),
                  unselectedFontSize: 11.sp,
                  currentIndex: state.page,
                  unselectedItemColor: AppColor.unselectedIcon,
                  selectedItemColor: AppColor.white,
                  showUnselectedLabels: true,
                  backgroundColor: AppColor.primaryColor,
                  onTap: _onItemTapped),
            ),
          ),
        );
      },
    );
  }

  void _onItemTapped(int index) {
    pagesBloc.add(ChangePageEvent(page: index));
    pageController.jumpToPage(index);
  }
}
