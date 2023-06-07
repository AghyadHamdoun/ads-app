import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../Preference.dart';
import '../../../core/constants/key_constants.dart';
import '../model/ads_details_model.dart';

abstract class GetAdsDetailsRemoteDataSource {
  Future<Either<String, AdsDetailsModel>> getAdsDetails({
    required String projectId
});
}

class GetAdsDetailsRemoteDataSourceImpl
    extends GetAdsDetailsRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  GetAdsDetailsRemoteDataSourceImpl(
      {required this.dio, required this.networkInfo});

  @override
  Future<Either<String, AdsDetailsModel>> getAdsDetails({
    required String projectId
   }) async {
    if (await networkInfo.hasConnection) {
      try {
        String userId=Preferences.preferences!.getString(KeyConstants.keyUserId)??'42';
        final re = await dio.get("${AppConstants.adsDetails}$projectId/$userId",
            data: {
        });

        return Right(AdsDetailsModel.fromJson(json.decode(re.data)));

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
