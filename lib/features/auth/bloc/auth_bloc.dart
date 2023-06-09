import 'package:ads/core/constants/key_constants.dart';
import 'package:ads/core/utils/enums.dart';
import 'package:ads/features/auth/bloc/auth_event.dart';
import 'package:ads/features/auth/bloc/auth_state.dart';
import 'package:ads/features/auth/login/api/login_remote.dart';
import 'package:ads/features/auth/login/models/login_model.dart';
import 'package:ads/features/auth/login/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Preference.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  BaseLoginRemoteDataSource loginRemoteDataSource;

  AuthBloc({
    required this.loginRemoteDataSource
  }) : super(AuthState.initial()) {
    on<LoginEvent>((event, emit) async {
      emit(state.rebuild((b) =>b
        ..loginState = RequestState.loading
        ..loginMessage = ''
        ..loginModel = LoginModel(
          user: User(
            id: 0,
            firstName: '',
            lastName: '',
            description: '',
            profilePicture: '',
            email: '',
            emailVerifiedAt: '',
            contactNumber: '',
            role: '',
            status: '',
            balance: '',
            verificationCode: '',
            mblConfirmationCode: '',
            createdAt: '',
            updatedAt: '',
            averageRating: '',
            orderNumbers: null,
          ),
          accessToken: '',)
      ));

      final result = await loginRemoteDataSource.login(
          email: event.email, password: event.password);
       result.fold((l) {
         emit(state.rebuild((b) =>b
         ..loginState =RequestState.error..loginMessage=l
         ));
       } , (r) {
         if (r.user!=null) {
        //   Preferences.preferences!.setString(r.accessToken!);
           Preferences.preferences!.setString(KeyConstants.keyUserId,
               r.user!.id.toString());
           Preferences.preferences!.setString(KeyConstants.keyRoleId,
               r.user!.role.toString());
         //  Preferences.saveUserName(r.user!.firstName!);
           emit(state.rebuild((b) =>
               b
               ..loginState =RequestState.loaded
               ..loginModel = r

           ));
         }
         });
       });
    }



void onLoginEvent({required String email,required String password}){
    add(LoginEvent(email: email, password: password));
}

}