


import 'package:ads/features/postProject/bloc/post_project_state.dart';
import 'package:ads/features/postProject/widgets/show_objective_bottom_sheet.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../Preference.dart';
import '../../core/constants/key_constants.dart';
import '../../core/customWidgets/custom_app_bar.dart';
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
  TextEditingController adsName=TextEditingController();
  TextEditingController adsDesc=TextEditingController();
  TextEditingController adsBalance=TextEditingController();
  TextEditingController location=TextEditingController();

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
                  state.messageModel!.message!,
                  style:
                  TextStyle(fontStyle: FontStyle.italic, fontSize: 14.sp),
                ),
              ),
            ),
            desc: state.messageModel!.message ?? "",
            btnOkOnPress: () {
              Navigator.pop(context, 'ref');
            },
          ).show();
        }
        else if (state.error!.isNotEmpty) {
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
        return  ModalProgressHUD(
          inAsyncCall: state.isLoadingPost!,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(1.sw,100.h),
              child: CustomAppbar(
                iconData: Icons.arrow_back,
                tittle: "New Advertisement".tr(),
                voidCallback: (){
                  Navigator.pop(context);
                },
              ),
            ),
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
                                  if (state.object != null)
                                    Icon(
                                      Icons
                                          .emoji_objects_outlined,
                                      color:
                                      AppColor.fourthColor,
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
                                              .fourthColor
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
                        showTypesBottomSheet(
                            ctx: context,
                            bloc: postProjectBloc
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w),
                        child: Card(
                          color: AppColor.thirdColor,
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
                                      AppColor.fourthColor,
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
                                              .fourthColor
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
                      labelText: "Advertisement Name".tr(),
                      controller: adsName,
                      textColor: AppColor.colorBlue,
                      borderColor: AppColor.secondColor,
                      hintColor: AppColor.colorBlue,
                      labelColor: AppColor.unselectedIcon,
                      isDense: true,
                      focusBorderColor: AppColor.primaryColor,
                    ),
                    TextFormFieldWidget(
                      labelText: "Advertisement Description".tr(),
                      controller: adsDesc,
                      textColor: AppColor.colorBlue,
                      borderColor: AppColor.secondColor,
                      hintColor: AppColor.colorBlue,
                      labelColor: AppColor.unselectedIcon,

                      isDense: true,
                      focusBorderColor: AppColor.primaryColor,

                    ),
                    TextFormFieldWidget(
                      labelText: "Advertisement Balance".tr(),
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
                      labelText: "Location".tr(),
                      controller: location,
                      textColor: AppColor.colorBlue,
                      borderColor: AppColor.secondColor,
                      hintColor: AppColor.colorBlue,
                      labelColor: AppColor.unselectedIcon,


                      isDense: true,
                      focusBorderColor: AppColor.primaryColor,
                    ),

                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: 1.sw,
                      child: ElevatedButtonWidget(
                        onPressed: (){
                            if(state.object==null)
                          {
                          Fluttertoast.showToast(
                          msg: "Please Select Object".tr(),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: AppColor.primaryColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                          }
                          if(adsName.text.trim().isEmpty)
                            {
                              Fluttertoast.showToast(
                                  msg: "Please Enter Advertisement Name".tr(),
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: AppColor.primaryColor,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          else  if(adsDesc.text.trim().isEmpty)
                          {
                            Fluttertoast.showToast(
                                msg: "Please Enter Advertisement Description".tr(),
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: AppColor.primaryColor,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                          else  if(adsBalance.text.trim().isEmpty)
                          {
                            Fluttertoast.showToast(
                                msg: "Please Enter Advertisement Balance".tr(),
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: AppColor.primaryColor,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                          else  if(location.text.trim().isEmpty)
                          {
                            Fluttertoast.showToast(
                                msg: "Please Enter Location".tr(),
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: AppColor.primaryColor,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                          else{
                            // String? userId = Preferences
                            //     .preferences!
                            //     .getString(
                            //        KeyConstants.keyUserId);
                            postProjectBloc
                                .add(SetPostProjectEvent(
                              object: {
                                "title": adsName.text,
                                "description": adsDesc.text,
                                "type": 0,
                                "objective": state.object!.id!,
                                "location": location.text,
                                "is_deleted": 0,
                                "amount": adsBalance.text,
                                "status": 1,
                                "posted_by":42,
                                "describe":"",
                                "requested_to":"",
                              },
                            ));
                          }


                        },
                        text: 'Update'.tr(),
                        bgColor: AppColor.secondColor,
                        textColor: AppColor.white,
                      ),
                    ),

                    SizedBox(height: 20.h,),


                  ],
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}
