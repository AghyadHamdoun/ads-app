import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../api/get_notifications.dart';
import 'notifications_state.dart';
part 'notifications_event.dart';


class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  GetNotificationsRemoteDataSource getNotificationsRemoteDataSource;


  NotificationsBloc({
    required this.getNotificationsRemoteDataSource,
  }) : super(NotificationsState.initial()) {

    on<GetNotificationsEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..isSuccess = false
        ..isLoading = true
        ..error = ''
        ..notificationsModel = null

      ));
      final result = await getNotificationsRemoteDataSource.getNotifications(
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
            ..notificationsModel = r
          ));
      });
    });
  }

}