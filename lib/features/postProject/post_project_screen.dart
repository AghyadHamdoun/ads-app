


import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/customWidgets/elevated_button_widget.dart';
import '../../core/customWidgets/text_form_field_widget.dart';
import '../../core/utils/app_colors.dart';



class PostProjectScreen extends StatefulWidget {
  const PostProjectScreen({Key? key}) : super(key: key);

  @override
  State<PostProjectScreen> createState() => _PostProjectScreenState();
}

class _PostProjectScreenState extends State<PostProjectScreen> {
  TextEditingController userController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController messageController=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 8.h
          ),
          child: Column(
            children: [
              SizedBox(height: 50.h,),
              // InkWell(
              //   onTap: () async {
              //     await Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) =>
              //           const EmployeePage(
              //             type: 'C',
              //           ),
              //         )).then((value) {
              //       if (value != null) {
              //         handoverMoneyBloc.add(
              //             ChangeEmployeeEvent(
              //                 employee: value));
              //       }
              //     });
              //   },
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(
              //         horizontal: 12.w),
              //     child: Card(
              //       color: MyColors.colorBlack,
              //       elevation: 2,
              //       child: Padding(
              //           padding: EdgeInsets.symmetric(
              //               vertical: 10.h,
              //               horizontal: 12.w),
              //           child: Row(
              //             children: [
              //               if (state.employee != null)
              //                 Icon(
              //                   Icons
              //                       .person_add_alt_1_outlined,
              //                   color:
              //                   MyColors.colorPrimary,
              //                   size: 19.sp,
              //                 ),
              //               SizedBox(
              //                 width: 20.w,
              //               ),
              //               Expanded(
              //                 child: Text(
              //                   state.employee != null
              //                       ? 'Handover Money To:\n${state.employee!.empName!}'
              //                       : 'Handover Money To',
              //                   style: TextStyle(
              //                       color: state.employee !=
              //                           null
              //                           ? MyColors
              //                           .primaryTheme
              //                           : MyColors.white,
              //                       fontSize: 14.sp),
              //                   textAlign: TextAlign.center,
              //                 ),
              //               ),
              //             ],
              //           )),
              //     ),
              //   ),
              // ),
              SizedBox(height: 20.h,),
              TextFormFieldWidget(
                labelText: "Profile Description".tr(),
                controller: messageController,
                textColor: AppColor.colorBlue,
                borderColor: AppColor.primaryColor,
                maxLines: 5,
                hintColor: AppColor.colorBlue,
                labelColor: AppColor.colorBlue,
                isDense: true,
                focusBorderColor: AppColor.primaryColor,
              ),
              TextFormFieldWidget(
                labelText: "User Name".tr(),
                controller: userController,
                textColor: AppColor.colorBlue,
                borderColor: AppColor.primaryColor,

                hintColor: AppColor.colorBlue,
                labelColor: AppColor.colorBlue,
                isDense: true,
                focusBorderColor: AppColor.primaryColor,
              ),
              TextFormFieldWidget(
                labelText: "Email".tr(),
                controller: emailController,
                textColor: AppColor.colorBlue,
                borderColor: AppColor.primaryColor,

                hintColor: AppColor.colorBlue,
                labelColor: AppColor.colorBlue,
                isDense: true,
                focusBorderColor: AppColor.primaryColor,
              ),
              TextFormFieldWidget(
                labelText: "Contact Number".tr(),
                controller: phoneController,
                textColor: AppColor.colorBlue,
                borderColor: AppColor.primaryColor,

                hintColor: AppColor.colorBlue,
                labelColor: AppColor.colorBlue,
                isDense: true,
                focusBorderColor: AppColor.primaryColor,
              ),

              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 1.sw,
                child: ElevatedButtonWidget(
                  onPressed: (){},
                  text: 'Update'.tr(),
                  bgColor: AppColor.primaryColor,
                  textColor: AppColor.white,
                ),
              ),

              SizedBox(height: 20.h,),


            ],
          ),
        ),
      ),
    );
  }
}
