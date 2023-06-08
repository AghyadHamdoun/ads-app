import 'package:ads/Preference.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';



import '../../../core/constants/key_constants.dart';
import '../api/add_offer_remote.dart';
import '../api/delete_offer_remote.dart';
import '../api/get_ads_details.dart';
import 'ads_details_state.dart';

part 'ads_details_event.dart';

class AdsDetailsBloc extends Bloc<AdsDetailsEvent, AdsDetailsState> {
  GetAdsDetailsRemoteDataSource getAdsDetailsRemoteDataSource;
  AddOfferDataSource addOfferDataSource;
  DeleteOfferDataSource deleteOfferDataSource;


  AdsDetailsBloc({
    required this.getAdsDetailsRemoteDataSource,
    required this.addOfferDataSource,
    required this.deleteOfferDataSource
  }) : super(AdsDetailsState.initial()) {

    on<GetAdsDetailsEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..isSuccess = false
        ..isLoading = true
        ..error = ''
        ..adsDetailsModel = null
        ..haveOffer = false


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
        String? userId = Preferences
            .preferences!
            .getString(
            KeyConstants.keyUserId)??'55';
        for(var item in r.message!.bids!)
          {
             if(item.proposalBy!.id.toString().endsWith(userId))
               {

                 emit(state.rebuild((b) =>
                 b ..haveOffer = true
                 ));
                 break;
               }
          }
          emit(state.rebuild((b) =>
          b ..isSuccess = true
            ..isLoading = false
            ..adsDetailsModel = r

          ));

      });
    });


    on<AddOfferEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..isSuccess = false
        ..isLoadingPost = true
        ..error = ''
        ..messageModel = null

      ));
      final result = await addOfferDataSource.addBid(
        obj: event.object
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



    on<DeleteAdsOfferEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..isSuccess = false
        ..isLoadingPost = true
        ..error = ''
        ..messageModel = null

      ));
      final result = await deleteOfferDataSource.deleteBid(
          offerId: event.id
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