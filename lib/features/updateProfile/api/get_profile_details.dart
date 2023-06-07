import 'dart:convert';
import 'package:ads/Preference.dart';
import 'package:ads/core/constants/key_constants.dart';
import 'package:ads/features/updateProfile/model/profile_details_model.dart';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import '../../../../core/constants/app_constants.dart';

abstract class GetProfileDetailsRemoteDataSource {
  Future<Either<String, ProfileDetailsModel>> getProfileDetails();
}

class GetProfileDetailsRemoteDataSourceImpl
    extends GetProfileDetailsRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  GetProfileDetailsRemoteDataSourceImpl(
      {required this.dio, required this.networkInfo});

  @override
  Future<Either<String, ProfileDetailsModel>> getProfileDetails() async {
    if (await networkInfo.hasConnection) {
      try {
        String userId=Preferences.preferences!.getString(KeyConstants.keyUserId)??'42';
        final re = await dio.get(AppConstants.getUserProfile+userId, data: {});

        return Right(ProfileDetailsModel.fromJson(json.decode(re.data)));

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
