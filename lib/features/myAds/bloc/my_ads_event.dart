part of 'my_ads_bloc.dart';

  abstract class MyAdsEvent extends Equatable {
  const MyAdsEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetMyAdsEvent extends MyAdsEvent {

}

class DeleteAdsEvent extends MyAdsEvent {
  final String id;
  const DeleteAdsEvent({required this.id});
}



