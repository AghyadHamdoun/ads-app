import 'package:built_value/built_value.dart';
import '../model/notifications_model.dart';

part 'notifications_state.g.dart';



abstract class NotificationsState implements Built<NotificationsState,
    NotificationsStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;

  String? get error;
  NotificationsModel? get notificationsModel;






  NotificationsState._();

  factory NotificationsState([void Function(NotificationsStateBuilder) updates]) = _$NotificationsState;

  factory NotificationsState.initial() {
    return NotificationsState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..error=''

    );
  }
}


