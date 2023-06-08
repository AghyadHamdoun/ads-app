import 'package:ads/Preference.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../core/constants/key_constants.dart';
import '../../core/customWidgets/custom_app_bar.dart';
import '../../core/customWidgets/elevated_button_widget.dart';
import '../../core/customWidgets/text_form_field_widget.dart';
import '../../core/utils/app_colors.dart';
import '../../injection.dart';
import 'bloc/add_amount_bloc.dart';
import 'bloc/add_amount_state.dart';



class AddAmountScreen extends StatefulWidget {
  const AddAmountScreen({Key? key}) : super(key: key);

  @override
  State<AddAmountScreen> createState() => _AddAmountScreenState();
}

class _AddAmountScreenState extends State<AddAmountScreen> {

  TextEditingController amountController=TextEditingController();
  AddAmountBloc addAmountBloc=sl<AddAmountBloc>();

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AddAmountBloc,AddAmountState>(
      bloc: addAmountBloc,
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

      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.isLoadingPost!,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(1.sw, 100.h),
              child: CustomAppbar(
                iconData: Icons.arrow_back,
                tittle: "AddAmount".tr(),
                voidCallback: () {
                  Navigator.pop(context);
                },
              ),
            ),

            body:
            SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20.h,),
                    SizedBox(height: 20.h,),

                    TextFormFieldWidget(
                      labelText: "Amount".tr(),
                      controller: amountController,
                      textColor: AppColor.colorBlue,
                      borderColor: AppColor.primaryColor,
                      textInputType: TextInputType.number,
                      hintColor: AppColor.colorBlue,
                      labelColor: AppColor.colorBlue,
                      isDense: true,
                      focusBorderColor: AppColor.primaryColor,
                    ),

                    SizedBox(
                      height: 40.h,
                    ),
                    SizedBox(
                      width: 1.sw,
                      child: ElevatedButtonWidget(
                        onPressed: (){
                          if (amountController.text.trim().isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Please Enter The Amount".tr(),
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: AppColor.primaryColor,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }

                          else {
                            String? userId = Preferences
                                .preferences!
                                .getString(
                                KeyConstants.keyUserId)??'42';
                            addAmountBloc.add(SetAddAmountEvent(
                              object: {
                                "amount": amountController.text,
                                "user_id": userId,

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
            )
          ),
        );
      },

    );
  }
}
