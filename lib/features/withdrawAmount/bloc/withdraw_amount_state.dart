import 'package:built_value/built_value.dart';
import '../../../core/model/message_model.dart';



part 'withdraw_amount_state.g.dart';



abstract class WithdrawAmountState implements Built<WithdrawAmountState,
    WithdrawAmountStateBuilder> {



  bool? get isSuccessPost;
  bool? get isLoadingPost;
  String? get error;
  MessageModel? get messageModel;





  WithdrawAmountState._();

  factory WithdrawAmountState([void Function(WithdrawAmountStateBuilder) updates]) = _$WithdrawAmountState;

  factory WithdrawAmountState.initial() {
    return WithdrawAmountState((b) => b
      ..isLoadingPost = false
      ..isSuccessPost = false
      ..error=''

    );
  }
}


