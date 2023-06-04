
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';



class CustomAppbar extends StatelessWidget {
  final VoidCallback voidCallback;
  final String tittle;
  final IconData iconData;


  const CustomAppbar({Key? key,
      required this.voidCallback,
       required this.tittle,
      required this.iconData
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColor.primaryColor,
        elevation: 3,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.sp),
          bottomRight: Radius.circular(25.sp),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: 20.h, left: 12.w, right: 12.w, bottom: 6.h),
          child: Column(
            children: [
              SizedBox(height: 40.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        AppColor.thirdColor,
                        AppColor.thirdColor,

                      ]),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: (){
                        voidCallback();
                      },
                      icon: Icon(
                        iconData,
                        size: 20.sp,
                        color: AppColor.white,
                      ),


                    ),
                  ),
                  SizedBox(width: 16.w,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tittle,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColor.white),
                        ),


                      ],
                    ),
                  ),
                  SizedBox(width: 6.w,),
                  Image.asset('assets/logo-white.png',height: 39.sp,width: 39.sp,),
                  SizedBox(width: 6.w,),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        AppColor.secondColor,
                        AppColor.secondColor,

                      ]),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: (){

                      },
                      icon: Icon(
                        Icons.notifications_outlined,
                        size: 20.sp,
                        color: AppColor.white,
                      ),


                    ),
                  ),


                ],
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 4.w),
              //   child: Container(
              //     color: AppColor.white,
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.end,
              //       children: [
              //         Expanded(child: TextField(
              //           maxLines: 1,
              //           controller: textEditingController,
              //           onChanged: (va) {
              //             bloc.add(SearchEmployeeEvent(se: va));
              //             },
              //           decoration: InputDecoration(
              //             isDense: true,
              //             fillColor: Colors.white,
              //             focusedBorder: UnderlineInputBorder(
              //               borderSide: BorderSide(
              //                   color: AppColor.colorPrimary, width: 1.0.w),
              //             ),
              //             enabledBorder: UnderlineInputBorder(
              //               borderSide: BorderSide(
              //                   color: AppColor.unselectedIcon, width: 1.0.w),
              //             ),
              //             label: Text(
              //               "Search",
              //               style: TextStyle(fontSize: 14.sp),
              //             ),
              //           ),
              //         )),
              //         SizedBox(
              //           width: 6.w,
              //         ),
              //         if(textEditingController.text.isNotEmpty)
              //         InkWell(
              //           onTap: (){
              //             voidCallbackClean();
              //
              //
              //           },
              //           child:  Container(
              //             decoration:  const BoxDecoration(
              //               color: Colors.red,
              //               shape: BoxShape.circle,
              //             ),
              //             child: Padding(
              //               padding: EdgeInsets.all(8.sp),
              //               child: Icon(
              //                 Icons.close,
              //                 size: 17.sp,
              //                 color: AppColor.white,
              //               ),
              //             ),
              //           ),
              //         ),
              //
              //       ],
              //     ),
              //   ),
              // ),

            ],
          ),
        ));
  }
}
