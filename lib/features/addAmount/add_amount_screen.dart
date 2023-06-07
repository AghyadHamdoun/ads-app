import 'dart:io';

import 'package:ads/Preference.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
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

late AddAmountBloc addAmountBloc;
late TextEditingController amountController;


class AddAmountScreen extends StatefulWidget {
  const AddAmountScreen({Key? key}) : super(key: key);

  @override
  State<AddAmountScreen> createState() => _AddAmountScreenState();
}

class _AddAmountScreenState extends State<AddAmountScreen> {

  late String selectedUrl;
  double value = 0.0;
  final bool _isLoading = true;
  late PullToRefreshController pullToRefreshController;
  late MyInAppBrowser browser;

  @override
  void initState() {
    addAmountBloc=sl<AddAmountBloc>();
    amountController=TextEditingController();
    super.initState();
  }

  void _initData(String amount) async {
    selectedUrl = "https://mobileapp.developerwaqas.com/select?amount=$amount";

    browser = MyInAppBrowser(amount: double.tryParse(amount)??0,);

    if (Platform.isAndroid) {
      await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

      bool swAvailable = await AndroidWebViewFeature.isFeatureSupported(AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
      bool swInterceptAvailable = await AndroidWebViewFeature.isFeatureSupported(AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

      if (swAvailable && swInterceptAvailable) {
        AndroidServiceWorkerController serviceWorkerController = AndroidServiceWorkerController.instance();
        await serviceWorkerController.setServiceWorkerClient(AndroidServiceWorkerClient(
          shouldInterceptRequest: (request) async {
            print(request);
            return null;
          },
        ));
      }
    }

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.black,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          browser.webViewController.reload();
        } else if (Platform.isIOS) {
          browser.webViewController.loadUrl(urlRequest: URLRequest(url: await browser.webViewController.getUrl()));
        }
      },
    );
    browser.pullToRefreshController = pullToRefreshController;

    await browser.openUrlRequest(
      urlRequest: URLRequest(url: Uri.parse(selectedUrl)),
      options: InAppBrowserClassOptions(
        inAppWebViewGroupOptions: InAppWebViewGroupOptions(crossPlatform: InAppWebViewOptions(useShouldOverrideUrlLoading: true, useOnLoadResource: true)),
        crossPlatform: InAppBrowserOptions(hideUrlBar: true, hideToolbarTop: Platform.isAndroid),
      ),
    );
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


                            _initData(amountController.text);


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

class MyInAppBrowser extends InAppBrowser {
  final double amount;
  MyInAppBrowser({ required this.amount,})
      : super();

  bool _canRedirect = true;

  @override
  Future onBrowserCreated() async {
    print("\n\nBrowser Created!\n\n");
  }

  @override
  Future onLoadStart(url) async {
    print("\n\nStarted: $url\n\n");
    _redirect(url.toString());
  }

  @override
  Future onLoadStop(url) async {
    pullToRefreshController?.endRefreshing();
    print("\n\nStopped: $url\n\n");
    _redirect(url.toString());
  }

  @override
  void onLoadError(url, code, message) {
    pullToRefreshController?.endRefreshing();
    print("Can't load [$url] Error: $message");
  }

  @override
  void onProgressChanged(progress) {
    if (progress == 100) {
      pullToRefreshController?.endRefreshing();
    }
    print("Progress: $progress");
  }

  @override
  void onExit() {
    if(_canRedirect) {
      //  Get.dialog(PaymentFailedDialog(orderID: orderID));
    }
    print("\n\nBrowser closed!\n\n");
  }

  @override
  Future<NavigationActionPolicy> shouldOverrideUrlLoading(navigationAction) async {
    print("\n\nOverride ${navigationAction.request.url}\n\n");
    return NavigationActionPolicy.ALLOW;
  }

  @override
  void onLoadResource(response) {
    print("Started at: ${response.startTime}ms ---> duration: ${response.duration}ms ${response.url ?? ''}");
  }

  @override
  void onConsoleMessage(consoleMessage) {
    print("""
    console output:
      message: ${consoleMessage.message}
      messageLevel: ${consoleMessage.messageLevel.toValue()}
   """);
  }

  void _redirect(String url) {
    if(_canRedirect) {
      bool _isSuccess = url.contains('/payment-success')||url.contains('Successful')||url.contains('Success')||url.contains('success');
      bool _isFailed = url.contains('/payment-fail');
      bool _isCancel = url.contains('/payment-cancel');
      if (_isSuccess || _isFailed || _isCancel) {
        _canRedirect = false;
        close();
      }
      if (_isSuccess) {
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
      else if (_isFailed || _isCancel) {
        addAmountBloc.add(AddErrorEvent("Payment Failed".tr()));
      }
    }
  }

}