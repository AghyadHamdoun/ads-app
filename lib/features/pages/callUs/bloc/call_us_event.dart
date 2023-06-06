part of 'call_us_bloc.dart';

  abstract class CallUsEvent extends Equatable {
  const CallUsEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class SetCallUsEvent extends CallUsEvent {
  final Map<String, Object> object;
  const SetCallUsEvent({required this.object});
}



