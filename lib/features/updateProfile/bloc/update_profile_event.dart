part of 'update_profile_bloc.dart';

  abstract class UpdateProfileEvent extends Equatable {
  const UpdateProfileEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetProfileDetailsEvent extends UpdateProfileEvent {

}


class SetUpdateProfileEvent extends UpdateProfileEvent {
  final Map<String, Object> object;
  const SetUpdateProfileEvent({required this.object});
}



