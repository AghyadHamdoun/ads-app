




import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

import 'pages_state.dart';


part 'pages_event.dart';


class PagesBloc extends Bloc<PagesEvent, PagesState> {


  PagesBloc() : super(PagesState.initial()) {
    on<ChangePageEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..page=event.page

        ));

    });
  }


}

