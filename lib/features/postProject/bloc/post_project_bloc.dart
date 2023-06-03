import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../api/get_types_objects.dart';
import '../model/type_and_object_model.dart';
import 'post_project_state.dart';

part 'post_project_event.dart';

class PostProjectBloc extends Bloc<PostProjectEvent, PostProjectState> {
  GetTypesObjectsRemoteDataSource getTypesObjectsRemoteDataSource;



  PostProjectBloc({
    required this.getTypesObjectsRemoteDataSource,
  }) : super(PostProjectState.initial()) {

    on<PostProjectEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..isSuccess = false
        ..isLoading = true
        ..error = ''
        ..typesAndObjectivesModel = null

      ));
      final result = await getTypesObjectsRemoteDataSource.getGetTypesObjects(
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
            ..typesAndObjectivesModel = r

          ));

      });
    });

    on<ChangeObjectEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..object = event.type

      ));});
    on<ChangeTypeEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..type = event.type

      ));});



  }

}