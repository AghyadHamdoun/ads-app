import 'package:ads/features/adsDetails/bloc/ads_details_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Preference.dart';
import '../../../core/constants/key_constants.dart';
import '../../../core/customWidgets/elevated_button_widget.dart';
import '../../../core/customWidgets/text_form_field_widget.dart';
import '../../../core/utils/app_colors.dart';


class AddOffer extends StatefulWidget {
  final AdsDetailsBloc adsDetailsBloc;
  final String projectId;
  const AddOffer({super.key,required this.adsDetailsBloc,required this.projectId});

  @override
  State<AddOffer> createState() => _AddOfferState();
}

class _AddOfferState extends State<AddOffer> {

  TextEditingController adsDesc = TextEditingController();
  TextEditingController adsDuration = TextEditingController();
  TextEditingController adsBalance = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(

        children: [
          SizedBox(height: 15.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.thirdColor,
                borderRadius: BorderRadius.circular(22.r)
              ),
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10.h, horizontal: 12.w),
                  child: Row(
                    children: [

                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Text(
                         'BidNow'.tr(),
                          style: TextStyle(
                              color: AppColor.white,
                              fontSize: 14.sp),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          TextFormFieldWidget(
            labelText: "BidAmount".tr(),
            controller: adsBalance,
            textColor: AppColor.colorBlue,
            borderColor: AppColor.secondColor,
            hintColor: AppColor.colorBlue,
            labelColor: AppColor.unselectedIcon,
            textInputType: TextInputType.number,
            isDense: true,
            focusBorderColor: AppColor.primaryColor,
          ),

          TextFormFieldWidget(
            labelText: "Duration".tr(),
            controller: adsDuration,
            textColor: AppColor.colorBlue,
            textInputType: TextInputType.number,
            borderColor: AppColor.secondColor,
            hintColor: AppColor.colorBlue,
            labelColor: AppColor.unselectedIcon,
            isDense: true,
            focusBorderColor: AppColor.primaryColor,
          ),

          TextFormFieldWidget(
            labelText: "ProposalDescription".tr(),
            controller: adsDesc,
            textColor: AppColor.colorBlue,
            borderColor: AppColor.secondColor,
            maxLines: 3,
            hintColor: AppColor.colorBlue,
            labelColor: AppColor.unselectedIcon,
            isDense: true,
            focusBorderColor: AppColor.primaryColor,
          ),

          SizedBox(
            width: 1.sw,
            child: ElevatedButtonWidget(
              onPressed: () {
                if (adsDuration.text.trim().isEmpty) {
                  Fluttertoast.showToast(
                      msg: "Please Enter Advertisement Duration".tr(),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: AppColor.primaryColor,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else if (adsDesc.text.trim().isEmpty) {
                  Fluttertoast.showToast(
                      msg: "Please Enter Advertisement Description"
                          .tr(),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: AppColor.primaryColor,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else if (adsBalance.text.trim().isEmpty) {
                  Fluttertoast.showToast(
                      msg: "Please Enter Advertisement Balance".tr(),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: AppColor.primaryColor,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }  else {
                  String? userId = Preferences
                      .preferences!
                      .getString(
                      KeyConstants.keyUserId)??'55';
                  widget.adsDetailsBloc.add(
                      AddOfferEvent(
                          object: {
                            "amount": adsBalance.text,
                            "duration": adsDuration.text,
                            "project_id": widget.projectId,
                            "proposal": adsDesc.text,
                            "proposal_by": userId,

                          }
                      ));

                }
              },
              text: 'SubmitBid'.tr(),
              bgColor: AppColor.secondColor,
              textColor: AppColor.white,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
