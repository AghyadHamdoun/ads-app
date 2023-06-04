import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import '../../../core/constants/app_constants.dart';
import '../model/type_and_object_model.dart';

abstract class GetTypesObjectsRemoteDataSource {
  Future<Either<String, TypesAndObjectivesModel>> getGetTypesObjects();
}

class GetTypesObjectsRemoteDataSourceImpl
    extends GetTypesObjectsRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  GetTypesObjectsRemoteDataSourceImpl(
      {required this.dio, required this.networkInfo});

  @override
  Future<Either<String, TypesAndObjectivesModel>> getGetTypesObjects() async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio.get(AppConstants.typesObjects, data: {});

        return Right(TypesAndObjectivesModel.fromJson(json.decode(re.data)));
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
