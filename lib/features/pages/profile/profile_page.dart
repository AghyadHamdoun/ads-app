import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 8.h
          ),
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: "http://via.placeholder.com/200x150",
                    imageBuilder: (context, imageProvider) => Container(
                      height:100.r,
                      width: 100.r,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            ),
                      ),
                    ),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
