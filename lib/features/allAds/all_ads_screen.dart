import 'package:ads/core/customWidgets/error_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../core/customWidgets/custom_app_bar.dart';
import '../../core/customList/list_all_ads.dart';
import '../../injection.dart';
import '../adsDetails/ads_details_screen.dart';
import 'bloc/all_ads_bloc.dart';
import 'bloc/all_ads_state.dart';


class AllAdsScreen extends StatefulWidget {
  const AllAdsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AllAdsScreen> createState() => _AllAdsScreenState();
}

class _AllAdsScreenState extends State<AllAdsScreen> {
  AllAdsBloc allAdsBloc = sl<AllAdsBloc>();

  @override
  void initState() {
    allAdsBloc.add(GetAllAdsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllAdsBloc, AllAdsState>(
      bloc: allAdsBloc,
      listener: (context, state) {

      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.isLoadingPost!,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(1.sw, 100.h),
              child: CustomAppbar(
                iconData: Icons.arrow_back,
                tittle: "All Ads".tr(),
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
                    child: state.allAdsModel != null && state.allAdsModel!.message!.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40.h,
                              ),
                              for (var item
                                  in state.allAdsModel!.message!)
                                Padding(
                                  padding:  EdgeInsets.only(
                                    bottom: 20.h
                                  ),
                                  child: ListAllAds(
                                    amount: item.amount??"",
                                    showDetails: (){
                                     Navigator.push(context, MaterialPageRoute(builder:
                                         (context) =>  AdsDetailsScreen(
                                           projectId: item.id!.toString(),
                                         ),));
                                    },
                                    desc: item.description??"",
                                    location: item.location??"",
                                    name: item.title,
                                    object: item.objective!=null?item.objective!.name:"",
                                    status: item.status=='1'?'InProgressProjects'.tr():"",
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
                              allAdsBloc.add(GetAllAdsEvent());
                            }),
                  )),
          ),
        );
      },
    );
  }
}
