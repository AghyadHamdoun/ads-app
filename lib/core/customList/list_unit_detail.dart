import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';



class ListUnitDetail extends StatelessWidget {
  const ListUnitDetail({super.key,

    this.type:"",
    this.value:"",
    this.iconData
}
      );

  final String?  type, value;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          color: Colors.white,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  type!,
                  style: TextStyle(
                      fontSize: 13.5.sp,
                      fontWeight: FontWeight.w500
                  ),
                  textAlign: TextAlign.start,

                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Expanded(child: Text(
                      value!,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColor.colorBlueTab,
                        fontWeight: FontWeight.w500
                      ),
                      textAlign: TextAlign.end,

                    ),),
                    if(iconData!=null)
                      SizedBox(width: 6.w,),
                    if(iconData!=null)
                      Icon(iconData,size: 19.sp,color: AppColor.colorBlueTab,),

                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 0.5.h,
        ),
      ],
    );
  }
}
