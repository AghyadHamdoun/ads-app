import 'package:ads/Preference.dart';
import 'package:ads/features/updateProfile/bloc/update_profile_bloc.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../core/constants/key_constants.dart';
import '../../core/customWidgets/custom_app_bar.dart';
import '../../core/customWidgets/elevated_button_widget.dart';
import '../../core/customWidgets/error_widget.dart';
import '../../core/customWidgets/text_form_field_widget.dart';
import '../../core/utils/app_colors.dart';
import '../../injection.dart';
import 'bloc/update_profile_state.dart';



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
  UpdateProfileBloc updateProfileBloc=sl<UpdateProfileBloc>();

  @override
  void initState() {
    updateProfileBloc.add(GetProfileDetailsEvent(

    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<UpdateProfileBloc,UpdateProfileState>(
      bloc: updateProfileBloc,
      listener: (context, state){
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
        else if(state.profileDetailsModel!=null)
          {
            userController=TextEditingController(text:state.profileDetailsModel!.message!.firstName??"" );
            phoneController=TextEditingController(text:state.profileDetailsModel!.message!.contactNumber??"" );
            emailController=TextEditingController(text:state.profileDetailsModel!.message!.email??"" );
            messageController=TextEditingController(text:state.profileDetailsModel!.message!.description??"" );
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
                tittle: "Update Profile".tr(),
                voidCallback: () {
                  Navigator.pop(context);
                },
              ),
            ),

            body:state.isLoading!?
                const Center(
                  child: CircularProgressIndicator(),
                ):
                state.isSuccess!?
            SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20.h,),
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
                      enabled: false,
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
                      textInputType: TextInputType.number,
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
                        onPressed: (){
                          if (userController.text.trim().isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Please Enter User Name".tr(),
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: AppColor.primaryColor,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                          else if (phoneController.text.trim().isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Please Enter Contract Number".tr(),
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: AppColor.primaryColor,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else if (messageController.text.trim().isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Please Enter Details".tr(),
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: AppColor.primaryColor,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else {
                            String? userId = Preferences
                                .preferences!
                                .getString(
                                KeyConstants.keyUserId)??'42';
                            updateProfileBloc.add(SetUpdateProfileEvent(
                              object: {
                                "first_name": userController.text,
                                "description": messageController.text,
                                "contact_number": phoneController.text,
                                "id": userId,

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
            ):ErrorTextWidget(
                error: 'No Data'.tr(),
                callback: () {
                  updateProfileBloc.add(GetProfileDetailsEvent(

                  ));
                }),
          ),
        );
      },

    );
  }
}
