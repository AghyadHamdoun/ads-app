import 'package:ads/core/utils/app_colors.dart';
import 'package:ads/features/auth/login/login.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  String dropdownValue = 'advertiser'.tr();

  AuthBloc bloc = sl<AuthBloc>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 0.2.sh,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
              height: 0.8.sh,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(45.r),
                      topLeft: Radius.circular(45.r)),
                  color: AppColor.primaryColor),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create New Account".tr(),
                      style: TextStyle(
                          fontSize: 26.sp,
                          color: AppColor.whiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
                    height: 1.sh,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(45.r),
                            topLeft: Radius.circular(45.r)),
                        color: AppColor.primaryColor),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Create New Account".tr(),
                            style: TextStyle(
                                fontSize: 26.sp,
                                color: AppColor.whiteColor,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          // first name
                          Text(
                            "first Name:".tr(),
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColor.whiteColor,
                                fontWeight: FontWeight.bold),
                    SizedBox(
                      height: 20.h,
                    ),
                    // name
                    Text(
                      "Name:".tr(),
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
                        controller: nameController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 5.h, bottom: 10.h, right: 5.w, left: 5.w),
                          hintText: "enter your name".tr(),
                          hintStyle: TextStyle(
                            color: AppColor.hintText,
                            fontSize: 14.sp,
                          ),
                          icon: Icon(
                            Icons.person,
                            size: 20.r,
                            color: AppColor.whiteColor,
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.whiteColor)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.whiteColor)),
                          disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.whiteColor),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 4.h),
                            height: 50.h,
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: 16.sp, color: AppColor.whiteColor),
                              controller: firstNameController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 5.h,
                                    bottom: 10.h,
                                    right: 5.w,
                                    left: 5.w),
                                hintText: "enter your first name".tr(),
                                hintStyle: TextStyle(
                                  color: AppColor.hintText,
                                  fontSize: 14.sp,
                                ),
                                icon: Icon(
                                  Icons.person,
                                  size: 20.r,
                                  color: AppColor.whiteColor,
                                ),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColor.whiteColor)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColor.whiteColor)),
                                disabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.whiteColor),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return tr(
                                    'Enter a valid name'.tr(),
                                  );
                                }
                                return null;
                              },
                            ),
                          ),

                          // last name
                          Text(
                            "Last Name:".tr(),
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
                              controller: lastNameController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 5.h,
                                    bottom: 10.h,
                                    right: 5.w,
                                    left: 5.w),
                                hintText: "enter your last name".tr(),
                                hintStyle: TextStyle(
                                  color: AppColor.hintText,
                                  fontSize: 14.sp,
                                ),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColor.whiteColor)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColor.whiteColor)),
                                disabledBorder: const OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: AppColor.whiteColor),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return tr(
                                    'Enter a valid name'.tr(),
                                  );
                                }
                                return null;
                              },
                            ),
                          ),
                          //
                          SizedBox(
                            height: 10.h,

                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return tr(
                              'Enter a valid name'.tr(),
                            );
                          }
                          return null;
                        },
                      ),
                    ),
                    //
                    SizedBox(
                      height: 10.h,
                    ),
                    //email
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
                        keyboardType: TextInputType.emailAddress,
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
                              borderSide:
                                  BorderSide(color: AppColor.whiteColor)),
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
                    //
                    SizedBox(
                      height: 10.h,
                    ),
                    //number
                    Text(
                      "phone number:".tr(),
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
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontSize: 16.sp, color: AppColor.whiteColor),
                        controller: numberController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 5.h, bottom: 10.h, right: 5.w, left: 5.w),
                          hintText: "enter your phone number".tr(),
                          hintStyle: TextStyle(
                            color: AppColor.hintText,
                            fontSize: 14.sp,
                          ),
                          icon: Icon(
                            Icons.phone,
                            size: 20.r,
                            color: AppColor.whiteColor,
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.whiteColor)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.whiteColor)),
                          disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.whiteColor),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return tr(
                              'Enter a valid number'.tr(),
                            );
                          }
                          return null;
                        },
                      ),
                    ),
                    //
                    SizedBox(
                      height: 10.h,
                    ),
                    //password
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
                            fontSize: 16.sp, color: AppColor.whiteColor),
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
                              borderSide:
                                  BorderSide(color: AppColor.whiteColor)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.whiteColor)),
                          disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.whiteColor),
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

                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "do you have an account?".tr(),
                          style: TextStyle(
                              fontSize: 14.sp, color: AppColor.whiteColor),
                        ),SizedBox(width: 5.w,),InkWell(
                          onTap: (){Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginScreen()));},
                          child: Text(
                            "login".tr(),
                            style: TextStyle(
                                fontSize: 14.sp, color: AppColor.whiteColor,fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    //button
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50.h,
                          width: 200.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(15.r)),
                          child: Text(
                            'register'.tr(),
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: AppColor.primaryColor,
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
                                  fontSize: 16.sp, color: AppColor.whiteColor),
                              controller: passwordController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 5.h,
                                    bottom: 10.h,
                                    right: 5.w,
                                    left: 5.w),
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
                                    borderSide:
                                        BorderSide(color: AppColor.whiteColor)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColor.whiteColor)),
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
                          //drop down
                          Row(
                            children: [
                              Text('role:'.tr(),style: TextStyle(color: AppColor.white,fontSize: 16.sp),),
                              SizedBox(width: 10.w,),
                              DropdownButton<String>(
                                dropdownColor: AppColor.primaryColor,
                                value: dropdownValue,
                                items: <String>['advertiser'.tr(), 'influencer'.tr()]
                                    .map<DropdownMenuItem<String>>((String value) {
                                      dropdownValue = value;
                                  return DropdownMenuItem<String>(
                                    value: dropdownValue,
                                    child: Text(
                                      value,
                                      style: TextStyle(fontSize: 16.sp,color: AppColor.white),
                                    ),
                                  );
                                }).toList(),
                                // Step 5.
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Text(
                                "do you have an account?".tr(),
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColor.whiteColor),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()));
                                },
                                child: Text(
                                  "login".tr(),
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColor.whiteColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          //button
                          Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                if (formKey.currentState!.mounted) {
                                  bloc.onRegisterEvent(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      contactNumber: numberController.text,
                                      role:dropdownValue.toString());
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            const Text('incomplete data').tr()),
                                  );
                                }
                              },
                              child: Container(
                                height: 50.h,
                                width: 200.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColor.whiteColor,
                                    borderRadius: BorderRadius.circular(15.r)),
                                child: Text(
                                  'register'.tr(),
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
