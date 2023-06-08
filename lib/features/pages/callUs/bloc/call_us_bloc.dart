import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../api/call_us_remote.dart';
import 'call_us_state.dart';

part 'call_us_event.dart';

class CallUsBloc extends Bloc<CallUsEvent, CallUsState> {
  CallUSDataSource callUSDataSource;


  CallUsBloc({
    required this.callUSDataSource
  }) : super(CallUsState.initial()) {




    on<SetCallUsEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..isSuccess = false
        ..isLoading = true
        ..error = ''
        ..messageModel = null

      ));
      final result = await callUSDataSource.callUs(
        obj: event.object
      );
      return result.fold((l) async {

        print('l');
        emit(state.rebuild((b) =>
        b
          ..isSuccess = false
          ..isLoading = false
          ..error = l));
      }, (r) async {
        print('r');
        emit(state.rebuild((b) =>
        b ..isSuccess = true
          ..isLoading = false
          ..messageModel = r

        ));

      });
    });




  }

}