
import 'package:ads/features/auth/bloc/auth_bloc.dart';
import 'package:ads/features/auth/login/api/login_remote.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'core/constants/app_constants.dart';
import 'features/auth/register/api/register_remote.dart';
import 'features/addAmount/api/add_amount_remote.dart';
import 'features/addAmount/bloc/add_amount_bloc.dart';
import 'features/myAds/api/delete_ads_remote.dart';
import 'features/myAds/api/get_my_ads.dart';
import 'features/myAds/bloc/my_ads_bloc.dart';
import 'features/notifications/api/get_notifications.dart';
import 'features/notifications/bloc/notifications_bloc.dart';
import 'features/pages/bloc/pages_bloc.dart';
import 'features/pages/callUs/api/call_us_remote.dart';
import 'features/pages/callUs/bloc/call_us_bloc.dart';
import 'features/pages/home/api/get_dashboard_data.dart';
import 'features/pages/home/bloc/home_bloc.dart';
import 'features/postProject/api/get_types_objects.dart';
import 'features/postProject/api/post_project_remote.dart';
import 'features/postProject/bloc/post_project_bloc.dart';
import 'features/updateProfile/api/get_profile_details.dart';
import 'features/updateProfile/api/update_profile_remote.dart';
import 'features/updateProfile/bloc/update_profile_bloc.dart';
import 'features/withdrawAmount/api/withdraw_amount_remote.dart';
import 'features/withdrawAmount/bloc/withdraw_amount_bloc.dart';



final sl = GetIt.instance;

///
/// The [init] function is responsible for adding the instances to the graph
///
Future<void> init() async {
  //!External

  /// Adding the [Dio] instance to the graph to be later used by the local data sources
  sl.registerLazySingleton(
    () {
      final dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 12),
          receiveTimeout: const Duration(seconds: 12),
          sendTimeout: const Duration(seconds: 12),
          baseUrl: AppConstants.baseUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          responseType: ResponseType.plain,
        ),
      );
      dio.interceptors.add(
        LogInterceptor(
            responseBody: true,
            requestBody: true,
            responseHeader: true,
            requestHeader: true,
            request: true,
            error: true),
      );

      return dio;
    },
  );

 sl.registerLazySingleton(() => DataConnectionChecker());

  // sl.registerSingleton<DataConnectionChecker>(DataConnectionChecker());
  //
  // //datasource
  sl.registerLazySingleton<GetTypesObjectsRemoteDataSource>(
    () => GetTypesObjectsRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<PostProjectDataSource>(
        () => PostProjectDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<GetDashboardDetailsRemoteDataSource>(
        () => GetDashboardDetailsRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<BaseLoginRemoteDataSource>(
        () => LoginRemoteDataSource(dio: sl(), networkInfo: sl()),
  );

  sl.registerLazySingleton<BaseRegisterRemoteDataSource>(
        () => RegisterRemoteDataSource(dio: sl(), networkInfo: sl()),
  );


  sl.registerLazySingleton<CallUSDataSource>(
        () => CallUSDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<GetProfileDetailsRemoteDataSource>(
        () => GetProfileDetailsRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<UpdateProfileDataSource>(
        () => UpdateProfileDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<GetNotificationsRemoteDataSource>(
        () => GetNotificationsRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<DeleteAdsDataSource>(
        () => DeleteAdsDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<GetMyAdsRemoteDataSource>(
        () => GetMyAdsRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<AddAmountDataSource>(
        () => AddAmountDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<WithdrawAmountDataSource>(
        () => WithdrawAmountDataSourceImpl(dio: sl(), networkInfo: sl()),
  );


  // Bloc
  sl.registerLazySingleton(() => PagesBloc());

  sl.registerLazySingleton(() => HomeBloc(
    getDashboardDetailsRemoteDataSource: sl()
  ));


  sl.registerLazySingleton(() => PostProjectBloc(
    getTypesObjectsRemoteDataSource: sl(),
    postProjectDataSource: sl()
  ));

  sl.registerLazySingleton(() => AuthBloc(loginRemoteDataSource: sl(), registerRemoteDataSource: sl()

  ));

  sl.registerLazySingleton(() => CallUsBloc(
      callUSDataSource: sl(),
   ));

  sl.registerLazySingleton(() => UpdateProfileBloc(
    getProfileDetailsRemoteDataSource: sl(),
    updateProfileDataSource: sl()
  ));

  sl.registerLazySingleton(() => NotificationsBloc(
      getNotificationsRemoteDataSource: sl(),
  ));

  sl.registerLazySingleton(() => MyAdsBloc(
    deleteAdsDataSource: sl(),
    getMyAdsRemoteDataSource: sl()
  ));

  sl.registerLazySingleton(() => AddAmountBloc(
      addAmountDataSource: sl(),
  ));
  sl.registerLazySingleton(() => WithdrawAmountBloc(
    withdrawAmountDataSource: sl(),
  ));


}
