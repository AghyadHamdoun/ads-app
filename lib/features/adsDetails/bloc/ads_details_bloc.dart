import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';



import '../api/get_ads_details.dart';
import 'ads_details_state.dart';

part 'ads_details_event.dart';

class AdsDetailsBloc extends Bloc<AdsDetailsEvent, AdsDetailsState> {
  GetAdsDetailsRemoteDataSource getAdsDetailsRemoteDataSource;
  //DeleteAdsDataSource deleteAdsDataSource;


  AdsDetailsBloc({
    required this.getAdsDetailsRemoteDataSource,
  }) : super(AdsDetailsState.initial()) {

    on<GetAdsDetailsEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..isSuccess = false
        ..isLoading = true
        ..error = ''
        ..adsDetailsModel = null

      ));
      final result = await getAdsDetailsRemoteDataSource.getAdsDetails(
        projectId: event.projectId
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
            ..adsDetailsModel = r

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