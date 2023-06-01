
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/customWidgets/elevated_button_widget.dart';
import '../../../core/customWidgets/text_form_field_widget.dart';
import '../../../core/utils/app_colors.dart';



class CallUsPage extends StatefulWidget {
  const CallUsPage({Key? key}) : super(key: key);

  @override
  State<CallUsPage> createState() => _CallUsPageState();
}

class _CallUsPageState extends State<CallUsPage> {

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
              SizedBox(height: 20.h,),
              Row(
                children: [
                   Expanded(
                     child: Text("Fill out this form below for any inquiries.".tr(),
                       style: TextStyle(
                         fontSize: 16.sp,
                         color: AppColor.colorBlack,
                         fontWeight: FontWeight.w600
                       ),
                       textAlign: TextAlign.center,
                     ),
                   ),
                ],
              ),
              SizedBox(height: 20.h,),
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
              TextFormFieldWidget(
                labelText: "Details".tr(),
                controller: messageController,
                textColor: AppColor.colorBlue,
                maxLines: 5,
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
                  text: 'Send',
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
