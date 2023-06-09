import 'package:ads/core/constants/key_constants.dart';
import 'package:ads/core/utils/app_colors.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Preference.dart';

import 'features/onboarding/screens/onboarding.dart';
import 'injection.dart' as di;
import 'features/pages/pages_screen.dart';

void main() async {
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  Preferences.init();
  await EasyLocalization.ensureInitialized();
  String userId=Preferences.preferences!.getString(KeyConstants.keyUserId)??"";
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'SA')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child:  MyApp(userId: userId,)));
}

class MyApp extends StatelessWidget {
  final String userId;
  const MyApp({super.key,required this.userId});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 786),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) =>
          MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
              useMaterial3: true,
            ),
            home: userId.isNotEmpty?const PagesScreen(): const OnBoardingScreen(),
          ),
    );
  }
}
