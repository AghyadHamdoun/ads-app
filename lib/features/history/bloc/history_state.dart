import 'package:built_value/built_value.dart';
import '../model/history_model.dart';

part 'history_state.g.dart';



abstract class HistoryState implements Built<HistoryState,
    HistoryStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;

  String? get error;
  HistoryModel? get historyModel;






  HistoryState._();

  factory HistoryState([void Function(HistoryStateBuilder) updates]) = _$HistoryState;

  factory HistoryState.initial() {
    return HistoryState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..error=''

    );
  }
}


