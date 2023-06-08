import 'dart:convert';
import 'package:ads/Preference.dart';
import 'package:ads/core/constants/key_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import '../../../../core/constants/app_constants.dart';
import '../model/notifications_model.dart';

abstract class GetNotificationsRemoteDataSource {
  Future<Either<String, NotificationsModel>> getNotifications();
}

class GetNotificationsRemoteDataSourceImpl
    extends GetNotificationsRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  GetNotificationsRemoteDataSourceImpl(
      {required this.dio, required this.networkInfo});

  @override
  Future<Either<String, NotificationsModel>> getNotifications() async {
    if (await networkInfo.hasConnection) {
      try {
        String userId=Preferences.preferences!.getString(KeyConstants.keyUserId)??'42';
        final re = await dio.get(AppConstants.notifications+userId, data: {
          "page":"1"
        });

        return Right(NotificationsModel.fromJson(json.decode(re.data)));

      } on DioError catch (ex) {
        if (ex.type == DioErrorType.connectionTimeout) {
          return Left(Er.networkError);
        } else if (ex.type == DioErrorType.receiveTimeout) {
          return Left(Er.networkError);
        }
        return Left(Er.error);
      } catch (e) {
        print(e);
        return Left(Er.error);
      }
    } else {
      return Left(Er.networkError);
    }
  }
}
