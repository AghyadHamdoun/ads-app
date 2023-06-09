import 'package:ads/core/utils/enums.dart';
import 'package:ads/features/auth/bloc/auth_event.dart';
import 'package:ads/features/auth/bloc/auth_state.dart';
import 'package:ads/features/auth/login/api/login_remote.dart';
import 'package:ads/features/auth/login/models/login_model.dart';
import 'package:ads/features/auth/login/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
           emit(state.rebuild((b) =>
               b
               ..loginState =RequestState.loaded
               ..loginModel = r

           ));
         }

            Preferences.saveUserToken(r.accessToken!);
            Preferences.saveUserId(r.user!.id!);
            Preferences.saveUserName(r.user!.firstName!);
          }));
        }
      });
       });
    });
  }
void onLoginEvent({required String email,required String password}){
    add(LoginEvent(email: email, password: password));
}

}