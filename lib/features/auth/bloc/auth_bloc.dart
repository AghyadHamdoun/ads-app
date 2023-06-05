import 'package:ads/Preference.dart';
import 'package:ads/core/utils/enums.dart';
import 'package:ads/features/auth/bloc/auth_event.dart';
import 'package:ads/features/auth/bloc/auth_state.dart';
import 'package:ads/features/auth/login/api/login_remote.dart';
import 'package:ads/features/auth/login/models/login_model.dart';
import 'package:ads/features/auth/login/models/user_model.dart';
import 'package:ads/features/auth/register/models/register_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../register/api/register_remote.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  BaseLoginRemoteDataSource loginRemoteDataSource;

  BaseRegisterRemoteDataSource registerRemoteDataSource;

  AuthBloc(
      {required this.loginRemoteDataSource,
      required this.registerRemoteDataSource})
      : super(AuthState.initial()) {
    // login event
    on<LoginEvent>((event, emit) async {
      emit(state.rebuild((b) => b
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
          accessToken: '',
        )));

      final result = await loginRemoteDataSource.login(
          email: event.email, password: event.password);
      result.fold((l) {
        emit(state.rebuild((b) => b
          ..loginState = RequestState.error
          ..loginMessage = l));
      }, (r) {
        if (r.accessToken!.isNotEmpty) {
          emit(state.rebuild((b) {
            b
              ..loginState = RequestState.loaded
              ..loginModel = r;

            Preferences.saveUserToken(r.accessToken!);
            Preferences.saveUserId(r.user!.id!);
            Preferences.saveUserImage(r.user!.profilePicture!);
            Preferences.saveUserName(r.user!.firstName!);
          }));
        }
      });
    });
    //register event
    on<RegisterEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..registerState = RequestState.loading
        ..registerMessage = ''
        ..registerModel = RegisterModel(
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
          accessToken: '',
          message: '',
        )));

      final result = await registerRemoteDataSource.register(
        email: event.email,
        password: event.password,
        firstName: event.firstName,
        lastName: event.lastName,
        contactNumber: event.contactNumber,
        role: event.role,
      );
      result.fold((l) {
        emit(state.rebuild((b) => b
          ..registerState = RequestState.error
          ..registerMessage = l));
      }, (r) {
        if (r.accessToken!.isNotEmpty) {
          emit(state.rebuild((b) {
            b
              ..registerState = RequestState.loaded
              ..registerModel = r;

            Preferences.saveUserToken(r.accessToken!);
            Preferences.saveUserId(r.user!.id!);
            Preferences.saveUserImage(r.user!.profilePicture!);
            Preferences.saveUserName(r.user!.firstName!);
          }));
        }
      });
    });
  }

  void onLoginEvent({required String email, required String password}) {
    add(LoginEvent(email: email, password: password));
  }

  void onRegisterEvent(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String contactNumber,
      required String role}) {
    add(RegisterEvent(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        contactNumber: contactNumber,
        role: role));
  }
}