import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';



import '../api/get_all_ads.dart';
import 'all_ads_state.dart';

part 'all_ads_event.dart';

class AllAdsBloc extends Bloc<AllAdsEvent, AllAdsState> {
  GetAllAdsRemoteDataSource getAllAdsRemoteDataSource;
  //DeleteAdsDataSource deleteAdsDataSource;


  AllAdsBloc({
    required this.getAllAdsRemoteDataSource,
  }) : super(AllAdsState.initial()) {

    on<GetAllAdsEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..isSuccess = false
        ..isLoading = true
        ..error = ''
        ..allAdsModel = null

      ));
      final result = await getAllAdsRemoteDataSource.getAllAds(
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
            ..allAdsModel = r

          ));

      });
    });


    // on<DeleteAdsEvent>((event, emit) async {
    //   emit(state.rebuild((b) =>
    //   b
    //     ..isSuccess = false
    //     ..isLoadingPost = true
    //     ..error = ''
    //     ..messageModel = null
    //
    //   ));
    //   final result = await deleteAdsDataSource.deleteAds(
    //     adsId: event.id
    //   );
    //   return result.fold((l) async {
    //
    //     print('l');
    //     emit(state.rebuild((b) =>
    //     b
    //       ..isSuccess = false
    //       ..isLoadingPost = false
    //       ..error = l));
    //   }, (r) async {
    //     print('r');
    //     emit(state.rebuild((b) =>
    //     b ..isSuccess = true
    //       ..isLoadingPost = false
    //       ..messageModel = r
    //
    //     ));
    //     emit(state.rebuild((b) =>
    //     b
    //       ..messageModel = null
    //
    //     ));
    //
    //   });
    // });




  }

}