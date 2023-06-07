part of 'ads_details_bloc.dart';

  abstract class AdsDetailsEvent extends Equatable {
  const AdsDetailsEvent();
  @override
  List<Object?> get props => [];
}

class GetAdsDetailsEvent extends AdsDetailsEvent {
  final String projectId;
  const GetAdsDetailsEvent(this.projectId);
}

class DeleteAdsOfferEvent extends AdsDetailsEvent {
  final String id;
  const DeleteAdsOfferEvent({required this.id});
}



