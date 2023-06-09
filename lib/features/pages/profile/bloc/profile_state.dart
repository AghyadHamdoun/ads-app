import 'package:ads/features/updateProfile/model/profile_details_model.dart';
import 'package:built_value/built_value.dart';



part 'profile_state.g.dart';



abstract class ProfileState implements Built<ProfileState,
    ProfileStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  bool? get isSuccessPost;
  bool? get isLoadingPost;
  String? get error;
  ProfileDetailsModel? get profileModel;





  ProfileState._();

  factory ProfileState([void Function(ProfileStateBuilder) updates]) = _$ProfileState;

  factory ProfileState.initial() {
    return ProfileState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..isLoadingPost = false
      ..isSuccessPost = false
      ..error=''

    );
  }
}


