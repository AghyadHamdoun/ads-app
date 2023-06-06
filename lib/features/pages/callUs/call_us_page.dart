import 'package:ads/features/pages/callUs/bloc/call_us_state.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../core/customWidgets/custom_app_bar.dart';
import '../../../core/customWidgets/elevated_button_widget.dart';
import '../../../core/customWidgets/text_form_field_widget.dart';
import '../../../core/utils/app_colors.dart';
import 'bloc/call_us_bloc.dart';

class CallUsPage extends StatefulWidget {
  final VoidCallback voidCallback;
  final CallUsBloc callUsBloc;

  const CallUsPage(
      {Key? key, required this.voidCallback, required this.callUsBloc})
      : super(key: key);

  @override
  State<CallUsPage> createState() => _CallUsPageState();
}

class _CallUsPageState extends State<CallUsPage>
    with AutomaticKeepAliveClientMixin {
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<CallUsBloc, CallUsState>(
      bloc: widget.callUsBloc,
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
              userController.clear();
              emailController.clear();
              phoneController.clear();
              messageController.clear();
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
          inAsyncCall: state.isLoading!,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(1.sw, 100.h),
              child: CustomAppbar(
                iconData: Icons.menu,
                tittle: "Call Us".tr(),
                voidCallback: () {
                  widget.voidCallback();
                  //Navigator.pop(context);
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Fill out this form below for any inquiries.".tr(),
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColor.colorBlack,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
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
                      textInputType: TextInputType.number,
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
                        onPressed: () {

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
                          else if (emailController.text.trim().isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Please Enter Your Email"
                                    .tr(),
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: AppColor.primaryColor,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else if (phoneController.text.trim().isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Please Enter Contact Number".tr(),
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

                          widget.callUsBloc.add(SetCallUsEvent(
                              object: {
                                "name": userController.text,
                                "email": emailController.text,
                                "number": phoneController.text,
                                "message": messageController.text,

                              },
                            ));
                          }
                        },
                        text: 'Send'.tr(),
                        bgColor: AppColor.primaryColor,
                        textColor: AppColor.white,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
