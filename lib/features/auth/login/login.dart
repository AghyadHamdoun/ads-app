
import 'package:ads/core/utils/app_colors.dart';
import 'package:ads/core/utils/enums.dart';
import 'package:ads/features/auth/bloc/auth_bloc.dart';
import 'package:ads/features/auth/bloc/auth_state.dart';
import 'package:ads/features/auth/register/register.dart';
import 'package:ads/features/pages/pages_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../injection.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  AuthBloc bloc = sl<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: bloc,
  listener: (context, state) {
      if (state.loginModel!.accessToken!.isNotEmpty) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const PagesScreen(),
          ),
              (route) => false,
        );
      }
    else if (state.loginMessage!.isNotEmpty) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: tr('login error'),
        desc: state.loginMessage,
        btnCancelText: tr('ok'),
        btnCancelOnPress: () {},
      ).show();
    }
  },
  builder: (context, state) {
    return ModalProgressHUD(
      inAsyncCall: state.loginState==RequestState.loading,
      child: SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 0.3.sh,
                alignment: Alignment.center,
                child: Image.asset('assets/images/logo-1.png',height: 150.h,width: 200.w,),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
                height: 0.7.sh,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(45.r),
                        topLeft: Radius.circular(45.r)),
                    color: AppColor.primaryColor),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back".tr(),
                        style: TextStyle(
                            fontSize: 26.sp,
                            color: AppColor.whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Text(
                        "Email:".tr(),
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColor.whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 4.h),
                        height: 50.h,
                        child: TextFormField(
                          style: TextStyle(
                              fontSize: 16.sp, color: AppColor.whiteColor),
                          controller: emailController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                top: 5.h, bottom: 10.h, right: 5.w, left: 5.w),
                            hintText: "enter your email".tr(),
                            hintStyle: TextStyle(
                              color: AppColor.hintText,
                              fontSize: 14.sp,
                            ),
                            icon: Icon(
                              Icons.email,
                              size: 20.r,
                              color: AppColor.whiteColor,
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColor.whiteColor)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.whiteColor)),
                            disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: AppColor.whiteColor),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return tr(
                                'Enter a valid email'.tr(),
                              );
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "password:".tr(),
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColor.whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4.h),
                  height: 50.h,
                  child: TextFormField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColor.whiteColor),
                    controller: passwordController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          top: 5.h, bottom: 10.h, right: 5.w, left: 5.w),
                      hintText: "Password".tr(),
                      hintStyle: TextStyle(
                        color: AppColor.hintText,
                        fontSize: 14.sp,
                      ),
                      icon: Icon(
                        Icons.lock,
                        size: 18.w,
                        color: AppColor.whiteColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.whiteColor)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.whiteColor)),
                      disabledBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: AppColor.whiteColor),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return tr('Enter a password');
                      }
                      if (value.length < 8) {
                        return tr('Password is short');
                      }
                      return null;
                    },
                  ),
                ),
                      SizedBox(height: 10.h,),
                      Row(
                        children: [
                          Text(
                            " haven't an account?".tr(),
                            style: TextStyle(
                                fontSize: 14.sp, color: AppColor.whiteColor),
                          ),SizedBox(width: 5.w,),InkWell(
                            onTap: (){Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const RegisterScreen()));},
                            child: Text(
                              "register".tr(),
                              style: TextStyle(
                                  fontSize: 14.sp, color: AppColor.whiteColor,fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: (){
                            if (_formKey.currentState!.mounted) {
                              bloc.onLoginEvent(
                                  email: emailController.text,
                                  password: passwordController.text);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: const Text('incomplete data')
                                        .tr()),
                              );
                            }

                          },
                          child: Container(height: 50.h,width:200.w,alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(15.r)
                          ),
                          child: Text('login'.tr(),style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold
                          ),),),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  },
);
  }
}
