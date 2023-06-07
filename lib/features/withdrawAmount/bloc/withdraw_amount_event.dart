part of 'withdraw_amount_bloc.dart';

  abstract class WithdrawAmountEvent extends Equatable {
  const WithdrawAmountEvent();
  @override
  List<Object?> get props => [];
}




class SetWithdrawAmountEvent extends WithdrawAmountEvent {
  final Map<String, Object> object;
  const SetWithdrawAmountEvent({required this.object});
}



