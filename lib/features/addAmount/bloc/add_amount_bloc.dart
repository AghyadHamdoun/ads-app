import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../api/add_amount_remote.dart';
import 'add_amount_state.dart';

part 'add_amount_event.dart';

class AddAmountBloc extends Bloc<AddAmountEvent, AddAmountState> {
  AddAmountDataSource addAmountDataSource;


  AddAmountBloc({
    required this.addAmountDataSource,
  }) : super(AddAmountState.initial()) {



    on<SetAddAmountEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..isSuccessPost = false
        ..isLoadingPost = true
        ..error = ''
        ..messageModel = null

      ));
      final result = await addAmountDataSource.addAmount(
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