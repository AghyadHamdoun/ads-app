import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';


import '../api/get_profile_details.dart';
import '../api/update_profile_remote.dart';
import 'update_profile_state.dart';

part 'update_profile_event.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  GetProfileDetailsRemoteDataSource getProfileDetailsRemoteDataSource;
  UpdateProfileDataSource updateProfileDataSource;


  UpdateProfileBloc({
    required this.getProfileDetailsRemoteDataSource,
    required this.updateProfileDataSource
  }) : super(UpdateProfileState.initial()) {

    on<GetProfileDetailsEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..isSuccess = false
        ..isLoading = true
        ..error = ''
        ..profileDetailsModel = null


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
            ..profileDetailsModel = r

          ));
        emit(state.rebuild((b) =>
        b
          ..profileDetailsModel = null

        ));

      });
    });




    on<SetUpdateProfileEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..isSuccessPost = false
        ..isLoadingPost = true
        ..error = ''
        ..messageModel = null

      ));
      final result = await updateProfileDataSource.updateProfile(
        obj: event.object
      );
      return result.fold((l) async {

        print('l');
        emit(state.rebuild((b) =>
        b
          ..isSuccessPost = false
          ..isLoadingPost = false
          ..error = l));
      }, (r) async {
        print('r');
        emit(state.rebuild((b) =>
        b ..isSuccessPost = true
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