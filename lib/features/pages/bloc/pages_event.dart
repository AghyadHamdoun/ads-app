part of 'pages_bloc.dart';

abstract class PagesEvent extends Equatable {
  const PagesEvent();
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ChangePageEvent extends PagesEvent {
  int page;
  ChangePageEvent({required this.page});

}


