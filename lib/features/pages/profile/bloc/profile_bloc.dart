import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../updateProfile/api/get_profile_details.dart';
import 'profile_state.dart';

part 'profile_event.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  GetProfileDetailsRemoteDataSource getProfileDetailsRemoteDataSource;
  //DeleteAdsDataSource deleteAdsDataSource;


  ProfileBloc({
    required this.getProfileDetailsRemoteDataSource,
  }) : super(ProfileState.initial()) {

    on<GetProfileEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..isSuccess = false
        ..isLoading = true
        ..error = ''
        ..profileModel = null

      ));
      final result = await getProfileDetailsRemoteDataSource.getProfileDetails(
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
            ..profileModel = r

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