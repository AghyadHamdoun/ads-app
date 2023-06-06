import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';


import '../api/delete_ads_remote.dart';
import '../api/get_my_ads.dart';
import 'my_ads_state.dart';

part 'my_ads_event.dart';

class MyAdsBloc extends Bloc<MyAdsEvent, MyAdsState> {
  GetMyAdsRemoteDataSource getMyAdsRemoteDataSource;
  DeleteAdsDataSource deleteAdsDataSource;


  MyAdsBloc({
    required this.getMyAdsRemoteDataSource,
    required this.deleteAdsDataSource
  }) : super(MyAdsState.initial()) {

    on<GetMyAdsEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..isSuccess = false
        ..isLoading = true
        ..error = ''
        ..myAdsModel = null

      ));
      final result = await getMyAdsRemoteDataSource.getMyAds(
      );
      return result.fold((l) async {

        print('l');
        emit(state.rebuild((b) =>
        b
          ..isSuccess = false
          ..isLoading = false
          ..error = l));
      }, (r) async {


        print('r');
          emit(state.rebuild((b) =>
          b ..isSuccess = true
            ..isLoading = false
            ..myAdsModel = r

          ));

      });
    });


    on<DeleteAdsEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..isSuccess = false
        ..isLoadingPost = true
        ..error = ''
        ..messageModel = null

      ));
      final result = await deleteAdsDataSource.deleteAds(
        adsId: event.id
      );
      return result.fold((l) async {

        print('l');
        emit(state.rebuild((b) =>
        b
          ..isSuccess = false
          ..isLoadingPost = false
          ..error = l));
      }, (r) async {
        print('r');
        emit(state.rebuild((b) =>
        b ..isSuccess = true
          ..isLoadingPost = false
          ..messageModel = r

        ));
        emit(state.rebuild((b) =>
        b
          ..messageModel = null

        ));

      });
    });




  }

}