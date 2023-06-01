import 'package:ads/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child:Column(
            children: [
              Container(margin: EdgeInsets.symmetric(vertical: 10.h),height: 0.1.sh,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle
              ),
              ),
              Text("Aghyad",style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold
              ),),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star,color: Colors.amber,size: 34.r,),
                  Icon(Icons.star,color: Colors.amber,size: 34.r,),
                  Icon(Icons.star,color: Colors.amber,size: 34.r,),
                  Icon(Icons.star,color: Colors.amber,size: 34.r,),
                  Icon(Icons.star,color: Colors.amber,size: 34.r,),
                ],
              )
            ],
          )
        ),
      ),
    ));
  }
}
