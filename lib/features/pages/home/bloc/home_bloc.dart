import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';


import '../api/get_dashboard_data.dart';
import 'home_state.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetDashboardDetailsRemoteDataSource getDashboardDetailsRemoteDataSource;


  HomeBloc({
    required this.getDashboardDetailsRemoteDataSource,
  }) : super(HomeState.initial()) {

    on<GetDashboardDetailsEvent>((event, emit) async {
      emit(state.rebuild((b) =>
      b
        ..isSuccess = false
        ..isLoading = true
        ..error = ''
        ..dashboardModel = null

      ));
      final result = await getDashboardDetailsRemoteDataSource.getDashboardDetails(
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
            ..dashboardModel = r
          ));
      });
    });
  }

}