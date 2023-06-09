import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/model/message_model.dart';


abstract class AddOfferDataSource {
  Future<Either<String, MessageModel>> addBid({
   required Map<String, Object> obj
  });
}

class AddOfferDataSourceImpl extends AddOfferDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  AddOfferDataSourceImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<String, MessageModel>> addBid(
      {
        required Map<String, Object> obj
      }
      ) async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio.post(
        AppConstants.addOffer,
          data: obj
        );
        return Right(MessageModel.fromJson(json.decode(re.data)));
      } on DioError catch (ex) {
        if (ex.type == DioErrorType.connectionTimeout) {
          return Left(Er.networkError);
        } else if (ex.type == DioErrorType.receiveTimeout) {
          return Left(Er.networkError);
        }
        return Left(Er.networkError);
      } catch (e) {
        return Left(Er.error);
      }
    } else {
      return Left(Er.networkError);
    }
  }
}
