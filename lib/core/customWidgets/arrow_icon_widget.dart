


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';



class ArrowIconWidget extends StatelessWidget {


  final Color? color;

  const ArrowIconWidget({Key? key, this.color}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return IconButton(
        constraints: const BoxConstraints(),
        onPressed: null,
        icon:  Icon(
          Icons.arrow_forward_ios,
          color: color??AppColor.colorBlue,
        ),
        iconSize: 17.5.sp,

      );

  }
}