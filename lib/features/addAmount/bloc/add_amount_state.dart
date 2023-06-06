import 'package:built_value/built_value.dart';
import '../../../core/model/message_model.dart';



part 'add_amount_state.g.dart';



abstract class AddAmountState implements Built<AddAmountState,
    AddAmountStateBuilder> {



  bool? get isSuccessPost;
  bool? get isLoadingPost;
  String? get error;
  MessageModel? get messageModel;





  AddAmountState._();

  factory AddAmountState([void Function(AddAmountStateBuilder) updates]) = _$AddAmountState;

  factory AddAmountState.initial() {
    return AddAmountState((b) => b
      ..isLoadingPost = false
      ..isSuccessPost = false
      ..error=''

    );
  }
}


