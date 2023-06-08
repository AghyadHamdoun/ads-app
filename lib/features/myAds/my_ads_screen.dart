import 'package:ads/core/customWidgets/error_widget.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../core/customWidgets/custom_app_bar.dart';
import '../../core/customList/list_ads.dart';
import '../../injection.dart';
import '../postProject/post_project_screen.dart';
import 'bloc/my_ads_bloc.dart';
import 'bloc/my_ads_state.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
  MyAdsBloc myAdsBloc = sl<MyAdsBloc>();

  @override
  void initState() {
    myAdsBloc.add(GetMyAdsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyAdsBloc, MyAdsState>(
      bloc: myAdsBloc,
      listener: (context, state) {
        if (state.messageModel != null) {
          AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.info,
            dismissOnTouchOutside: false,
            dismissOnBackKeyPress: false,
            body: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: Text(
                  state.messageModel!.message==1?
                  'The ad has been successfully deleted'.tr():"",
                  style:
                  TextStyle(fontStyle: FontStyle.italic, fontSize: 14.sp),
                ),
              ),
            ),
            desc: state.messageModel!.message==1?
            'The ad has been successfully deleted'.tr():"",
            btnOkOnPress: () {
              Navigator.pop(context, 'ref');
            },
          ).show();
        } else if (state.error!.isNotEmpty) {
          AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.error,
            body: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: Text(
                  state.error ?? "",
                  style:
                  TextStyle(fontStyle: FontStyle.italic, fontSize: 14.sp),
                ),
              ),
            ),
            desc: state.error,
            btnOkColor: Colors.red,
            btnOkOnPress: () {
              //  Navigator.pop(context);
            },
          ).show();
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.isLoadingPost!,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(1.sw, 100.h),
              child: CustomAppbar(
                iconData: Icons.arrow_back,
                tittle: "My Ads".tr(),
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
                    child: state.myAdsModel != null && state.myAdsModel!.message!.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40.h,
                              ),
                              for (var item
                                  in state.myAdsModel!.message!)
                                Padding(
                                  padding:  EdgeInsets.only(
                                    bottom: 20.h
                                  ),
                                  child: ListAds(
                                    amount: item.amount??"",
                                    delete: (){
                                      myAdsBloc.add(DeleteAdsEvent(id: item.id.toString()));
                                    },
                                    desc: item.description??"",
                                    location: item.location??"",
                                    name: item.title,
                                    object: item.objective!=null?item.objective!.name:"",
                                    status: item.status=='1'?'InProgressProjects'.tr():"",
                                    edit: () async {
                                     await Navigator.push(context, MaterialPageRoute(builder:
                                          (context) =>   PostProjectScreen(
                                        name: item.title??"",
                                        desc: item.description??"",
                                        type: 'Update',
                                        balance: item.amount??"",
                                        loc: item.location??"",
                                        obj: item.objective,
                                          projectId: item.id.toString(),
                                      ),)).then((value) {
                                        if(value is String)
                                          {
                                            myAdsBloc.add(GetMyAdsEvent());
                                          }
                                     });

                                    },
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
                              myAdsBloc.add(GetMyAdsEvent());
                            }),
                  )),
          ),
        );
      },
    );
  }
}
