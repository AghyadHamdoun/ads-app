import 'package:ads/core/customWidgets/error_widget.dart';
import 'package:ads/features/adsDetails/widgets/add_offer.dart';
import 'package:ads/features/adsDetails/widgets/show_offers.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../core/customWidgets/custom_app_bar.dart';
import '../../Preference.dart';
import '../../core/constants/key_constants.dart';
import '../../core/customList/list_all_ads.dart';
import '../../injection.dart';
import 'bloc/ads_details_bloc.dart';
import 'bloc/ads_details_state.dart';

class AdsDetailsScreen extends StatefulWidget {
  final String projectId;

  const AdsDetailsScreen({Key? key, required this.projectId}) : super(key: key);

  @override
  State<AdsDetailsScreen> createState() => _AdsDetailsScreenState();
}

class _AdsDetailsScreenState extends State<AdsDetailsScreen> {
  AdsDetailsBloc adsDetailsBloc = sl<AdsDetailsBloc>();
  String? userId;
  @override
  void initState() {
    adsDetailsBloc.add(GetAdsDetailsEvent(widget.projectId));
     userId = Preferences
        .preferences!
        .getString(
        KeyConstants.keyUserId)??'55';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdsDetailsBloc, AdsDetailsState>(
      bloc: adsDetailsBloc,
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
                  "Success".tr(),
                  style:
                      TextStyle(fontStyle: FontStyle.italic, fontSize: 14.sp),
                ),
              ),
            ),
            desc: state.messageModel!.message.toString().tr(),
            btnOkOnPress: () {
              adsDetailsBloc.add(GetAdsDetailsEvent(widget.projectId));
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
                tittle: "Ads Details".tr(),
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
                    child: state.adsDetailsModel != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 20.h),
                                child: ListAllAds(
                                  amount:
                                      state.adsDetailsModel!.message!.amount ??
                                          "",
                                  showDetails: null,
                                  desc: state.adsDetailsModel!.message!
                                          .description ??
                                      "",
                                  location: state
                                          .adsDetailsModel!.message!.location ??
                                      "",
                                  name: state.adsDetailsModel!.message!.title,
                                  object: state.adsDetailsModel!.message!
                                              .objective !=
                                          null
                                      ? state.adsDetailsModel!.message!
                                          .objective!.name
                                      : "",
                                  status:
                                      state.adsDetailsModel!.message!.status ==
                                              '1'
                                          ? 'InProgressProjects'.tr()
                                          : "",
                                ),
                              ),
                              state.haveOffer
                                  ? ShowOffers(
                                      adsDetailsBloc: adsDetailsBloc,
                                       userId: userId!,
                                    )
                                  : AddOffer(adsDetailsBloc:adsDetailsBloc,
                                      projectId: widget.projectId,
                                    ),
                              SizedBox(
                                height: 40.h,
                              ),
                            ],
                          )
                        : ErrorTextWidget(
                            error: 'No Data'.tr(),
                            callback: () {
                              adsDetailsBloc
                                  .add(GetAdsDetailsEvent(widget.projectId));
                            }),
                  )),
          ),
        );
      },
    );
  }
}
