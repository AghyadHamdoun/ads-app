import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../api/withdraw_amount_remote.dart';
import 'withdraw_amount_state.dart';

part 'withdraw_amount_event.dart';

class WithdrawAmountBloc extends Bloc<WithdrawAmountEvent, WithdrawAmountState> {
  WithdrawAmountDataSource withdrawAmountDataSource;


  WithdrawAmountBloc({
    required this.withdrawAmountDataSource,
  }) : super(WithdrawAmountState.initial()) {



    on<SetWithdrawAmountEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..isSuccessPost = false
        ..isLoadingPost = true
        ..error = ''
        ..messageModel = null

      ));
      final result = await withdrawAmountDataSource.withdrawAmount(
        obj: event.object
      );
      return result.fold((l) async {

        print('l');
        emit(state.rebuild((b) =>
        b
          ..isSuccessPost = false
          ..isLoadingPost = false
          ..error = l));
      }, (r) async {
        print('r');
        emit(state.rebuild((b) =>
        b ..isSuccessPost = true
          ..isLoadingPost = false
          ..messageModel = r

        ));
        emit(state.rebuild((b) =>
        b
          ..messageModel = null

        ));



      });
    });




  }

}