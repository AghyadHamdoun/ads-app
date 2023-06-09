import 'package:ads/features/adsDetails/bloc/ads_details_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Preference.dart';
import '../../../core/constants/key_constants.dart';
import '../../../core/customWidgets/custom_app_bar.dart';
import '../../../core/customWidgets/elevated_button_widget.dart';
import '../../../core/customWidgets/text_form_field_widget.dart';
import '../../../core/utils/app_colors.dart';


class EditOffer extends StatefulWidget {
  final AdsDetailsBloc adsDetailsBloc;
  final String bidId;
  final String desc;
  final String duration;
  final String balance;

  const EditOffer({super.key,required this.adsDetailsBloc,required this.bidId,
   required this.desc,
    required this.duration,
    required this.balance,
  });

  @override
  State<EditOffer> createState() => _EditOfferState();
}

class _EditOfferState extends State<EditOffer> {

 late TextEditingController adsDesc ;
 late TextEditingController adsDuration;
 late TextEditingController adsBalance ;

  @override
  void initState() {
     adsDesc = TextEditingController(
        text: widget.desc
    );
     adsDuration = TextEditingController(
       text: widget.duration
     );
     adsBalance = TextEditingController(
       text: widget.balance
     );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(1.sw, 100.h),
        child: CustomAppbar(
          iconData: Icons.arrow_back,
          tittle: "Edit Bid".tr(),
          voidCallback: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SingleChildScrollView(
        child:
        Column(
         children: [
           SizedBox(
             height: 50.h,
           ),
           Card(
             elevation: 4,
             child: Column(

               children: [
                 SizedBox(height: 15.h,),
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

                         widget.adsDetailsBloc.add(
                             EditOfferEvent(
                                 object: {
                                   "amount": adsBalance.text,
                                   "duration": adsDuration.text,
                                   "bid_id": widget.bidId,
                                   "proposal": adsDesc.text,

                                 }
                             ));
                         Navigator.pop(context);

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
           ),
         ],
        ),
      ),
    );
  }
}
