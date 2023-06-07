



import 'package:built_value/built_value.dart';
import '../../../core/model/message_model.dart';
import '../model/profile_details_model.dart';



part 'update_profile_state.g.dart';



abstract class UpdateProfileState implements Built<UpdateProfileState,
    UpdateProfileStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  bool? get isSuccessPost;
  bool? get isLoadingPost;
  String? get error;
  ProfileDetailsModel? get profileDetailsModel;
  MessageModel? get messageModel;





  UpdateProfileState._();

  factory UpdateProfileState([void Function(UpdateProfileStateBuilder) updates]) = _$UpdateProfileState;

  factory UpdateProfileState.initial() {
    return UpdateProfileState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..isLoadingPost = false
      ..isSuccessPost = false
      ..error=''

    );
  }
}


