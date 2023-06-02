


import 'package:ads/features/postProject/bloc/post_project_state.dart';
import 'package:ads/features/postProject/widgets/show_objective_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/customWidgets/elevated_button_widget.dart';
import '../../core/customWidgets/text_form_field_widget.dart';
import '../../core/utils/app_colors.dart';
import '../../injection.dart';
import 'bloc/post_project_bloc.dart';
import 'widgets/show_types_bottom_sheet.dart';



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

  PostProjectBloc postProjectBloc=sl<PostProjectBloc>();


  @override
  void initState() {
    postProjectBloc.add(GetTypesObjectsEvent());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<PostProjectBloc,PostProjectState>(
      bloc: postProjectBloc,
      listener: (context, state) {

      },
      builder: (context, state) {
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
                  InkWell(
                    onTap: () async {
                      showTypesBottomSheet(
                         ctx: context,
                         bloc: postProjectBloc
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w),
                      child: Card(
                        color: AppColor.primaryColor,
                        elevation: 2,
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h,
                                horizontal: 12.w),
                            child: Row(
                              children: [
                                if (state.object != null)
                                  Icon(
                                    Icons
                                        .emoji_objects_outlined,
                                    color:
                                    AppColor.primaryColor,
                                    size: 19.sp,
                                  ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Expanded(
                                  child: Text(
                                    state.object != null
                                        ? state.object!.name??""
                                        : 'Select Object'.tr(),
                                    style: TextStyle(
                                        color: state.object !=
                                            null
                                            ? AppColor
                                            .primaryTheme
                                            : AppColor.white,
                                        fontSize: 14.sp),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  InkWell(
                    onTap: () async {
                      showObjectiveBottomSheet(
                          ctx: context,
                          bloc: postProjectBloc
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w),
                      child: Card(
                        color: AppColor.primaryColor,
                        elevation: 2,
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h,
                                horizontal: 12.w),
                            child: Row(
                              children: [
                                if (state.type != null)
                                  Icon(
                                    Icons
                                        .type_specimen_outlined,
                                    color:
                                    AppColor.primaryColor,
                                    size: 19.sp,
                                  ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Expanded(
                                  child: Text(
                                    state.type != null
                                        ? state.type!.name??""
                                        : 'Select Type'.tr(),
                                    style: TextStyle(
                                        color: state.type !=
                                            null
                                            ? AppColor
                                            .primaryTheme
                                            : AppColor.white,
                                        fontSize: 14.sp),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
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
      },

    );
  }
}
