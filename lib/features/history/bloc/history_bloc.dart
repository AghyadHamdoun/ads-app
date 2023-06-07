import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../api/get_history.dart';
import 'history_state.dart';
part 'history_event.dart';


class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  GetHistoryRemoteDataSource getHistoryRemoteDataSource;


  HistoryBloc({
    required this.getHistoryRemoteDataSource,
  }) : super(HistoryState.initial()) {

    on<GetHistoryEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..isSuccess = false
        ..isLoading = true
        ..error = ''
        ..historyModel = null

      ));
      final result = await getHistoryRemoteDataSource.getHistory(
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
            ..historyModel = r
          ));
      });
    });
  }

}