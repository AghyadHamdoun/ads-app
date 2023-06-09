import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import '../../../../core/constants/app_constants.dart';
import '../model/all_ads_model.dart';

abstract class GetAllAdsRemoteDataSource {
  Future<Either<String, AllAdsModel>> getAllAds();
}

class GetAllAdsRemoteDataSourceImpl
    extends GetAllAdsRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  GetAllAdsRemoteDataSourceImpl(
      {required this.dio, required this.networkInfo});

  @override
  Future<Either<String, AllAdsModel>> getAllAds() async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio.get(AppConstants.allAds,
            data: {
        });

        return Right(AllAdsModel.fromJson(json.decode(re.data)));

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
