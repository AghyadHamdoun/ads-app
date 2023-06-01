import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/customWidgets/elevated_button_widget.dart';
import '../../core/customWidgets/text_form_field_widget.dart';
import '../../core/utils/app_colors.dart';



class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: "http://via.placeholder.com/200x150",
                      imageBuilder: (context, imageProvider) => Container(
                        height: 100.r,
                        width: 100.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill,
                              ),
                        ),
                      ),
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ],
                ),
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
