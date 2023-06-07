part of 'all_ads_bloc.dart';

  abstract class AllAdsEvent extends Equatable {
  const AllAdsEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetAllAdsEvent extends AllAdsEvent {

}

class DeleteAdsEvent extends AllAdsEvent {
  final String id;
  const DeleteAdsEvent({required this.id});
}



