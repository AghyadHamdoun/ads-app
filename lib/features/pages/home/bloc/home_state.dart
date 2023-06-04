import 'package:built_value/built_value.dart';
import '../model/dashboard_model.dart';

part 'home_state.g.dart';



abstract class HomeState implements Built<HomeState,
    HomeStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;

  String? get error;
  DashboardModel? get dashboardModel;






  HomeState._();

  factory HomeState([void Function(HomeStateBuilder) updates]) = _$HomeState;

  factory HomeState.initial() {
    return HomeState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..error=''

    );
  }
}


