import 'package:ads/core/utils/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/post_project_bloc.dart';
import '../bloc/post_project_state.dart';



Future<String?> showObjectiveBottomSheet({
  required BuildContext ctx,
  required PostProjectBloc bloc,
  }) async {

  bool first=true;
  TextEditingController textEditingController=TextEditingController();
  showModalBottomSheet(
      isScrollControlled: true,
      elevation: 10,
      backgroundColor: Theme.of(ctx).scaffoldBackgroundColor,
      context: ctx,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.w),
          topRight: Radius.circular(30.w),
        ),
      ),
      builder: (ctx) => BlocBuilder<PostProjectBloc,PostProjectState>(
        bloc: bloc,
        builder: (context, state) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration:  BoxDecoration(
                  color: Theme.of(ctx).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                alignment: Alignment.center,
                width: 1.sw,
                height: 350.h,
                child: Column(
                  children: [
                    Container(
                      
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('Objects'.tr(),
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.colorBlack
                              ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ).tr(),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: 20.h,),
                    // Container(
                    //   margin: EdgeInsets.symmetric(vertical: 4.h),
                    //   height: 45.h,
                    //   child: TextFormField(
                    //
                    //     style: TextStyle(
                    //         fontSize: 16.sp,
                    //         color: AppColor.textColor),
                    //     controller: textEditingController,
                    //     decoration: InputDecoration(
                    //       contentPadding: EdgeInsets.only(
                    //           top: 5.h, bottom: 10.h, right: 5, left: 5),
                    //       hintText: "Search for a type".tr(),
                    //       hintStyle: TextStyle(
                    //         color: AppColor.hintText,
                    //         fontSize: 14.sp,
                    //       ),
                    //
                    //       focusedBorder: const UnderlineInputBorder(
                    //           borderSide: BorderSide(
                    //               color:AppColor.textColor)),
                    //       enabledBorder: const UnderlineInputBorder(
                    //           borderSide: BorderSide(
                    //               color: AppColor.hintText)),
                    //       disabledBorder: const UnderlineInputBorder(
                    //         borderSide:
                    //         BorderSide(color: AppColor.hintText),
                    //       ),
                    //     ),
                    //     onChanged: (va){
                    //
                    //     },
                    //
                    //   ),
                    // ),
                    SizedBox(height: 20.h,),
                    Expanded(
                      child:
                      state.isLoading!?
                      const Center(
                        child: CircularProgressIndicator(),
                      ):
                    state.typesAndObjectivesModel!.message!.objective!.isNotEmpty?
                      ListView.separated(

                          itemBuilder: (context, index) {
                            return  Padding(
                                padding:  EdgeInsets.symmetric(
                                    horizontal: 12.w
                                ),
                                child: InkWell(
                                  onTap: (){
                                    bloc.add(ChangeObjectEvent(
                                        state.typesAndObjectivesModel!.message!.objective![index]));
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    children: [
                                      SizedBox(width: 6.w,),
                                      Expanded(
                                        child: Text(
                                          state.typesAndObjectivesModel!.message!.objective![index].name??'',
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context).primaryColorDark
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                        ),
                                      ),


                                    ],
                                  ),
                                )
                            );
                          }, separatorBuilder: (context, index) {
                        return  Divider(
                          thickness:1,
                          color: Theme.of(context).hintColor,
                        );
                      }, itemCount: state.typesAndObjectivesModel!.message!.objective!.length):

                      Center(
                        child: Text('No Data'.tr(),
                          style: TextStyle(
                            fontSize: 16.sp,

                          ),
                        ).tr(),
                      )


                      ,
                    ),
                    Divider(
                      thickness:1,
                      color: Theme.of(ctx).hintColor,
                    ),
                    SizedBox(height: 30.h,),

                  ],
                ),
              );
            },

          );
        },


      ));
  return '';
}
