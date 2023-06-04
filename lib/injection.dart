
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/constants/app_constants.dart';
import 'features/pages/bloc/pages_bloc.dart';
import 'features/pages/home/api/get_dashboard_data.dart';
import 'features/pages/home/bloc/home_bloc.dart';
import 'features/postProject/api/get_types_objects.dart';
import 'features/postProject/api/post_project_remote.dart';
import 'features/postProject/bloc/post_project_bloc.dart';



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



  // Bloc
  sl.registerLazySingleton(() => PagesBloc());

  sl.registerLazySingleton(() => HomeBloc(
    getDashboardDetailsRemoteDataSource: sl()
  ));


  sl.registerLazySingleton(() => PostProjectBloc(
    getTypesObjectsRemoteDataSource: sl(),
    postProjectDataSource: sl()
  ));




}
