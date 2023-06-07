part of 'add_amount_bloc.dart';

  abstract class AddAmountEvent extends Equatable {
  const AddAmountEvent();
  @override
  List<Object?> get props => [];
}

class GetProfileDetailsEvent extends AddAmountEvent {

}


class SetAddAmountEvent extends AddAmountEvent {
  final Map<String, Object> object;
  const SetAddAmountEvent({required this.object});
}



