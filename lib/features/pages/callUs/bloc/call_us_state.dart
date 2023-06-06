



import 'package:built_value/built_value.dart';
import '../../../../core/model/message_model.dart';



part 'call_us_state.g.dart';



abstract class CallUsState implements Built<CallUsState,
    CallUsStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;

  String? get error;

  MessageModel? get messageModel;





  CallUsState._();

  factory CallUsState([void Function(CallUsStateBuilder) updates]) = _$CallUsState;

  factory CallUsState.initial() {
    return CallUsState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..error=''

    );
  }
}


