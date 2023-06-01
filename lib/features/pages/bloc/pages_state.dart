



import 'package:built_value/built_value.dart';




part 'pages_state.g.dart';


abstract class PagesState implements Built<PagesState,
    PagesStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  String? get error;
  int get page;



  PagesState._();

  factory PagesState([void Function(PagesStateBuilder) updates]) = _$PagesState;

  factory PagesState.initial() {
    return PagesState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..error=''
      ..page=0


    );
  }
}


