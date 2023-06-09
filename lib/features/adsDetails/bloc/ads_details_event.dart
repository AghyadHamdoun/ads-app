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

class AddOfferEvent extends AdsDetailsEvent {
  final Map<String, Object> object;
  const AddOfferEvent({required this.object});
}

class EditOfferEvent extends AdsDetailsEvent {
  final Map<String, Object> object;
  const EditOfferEvent({required this.object});
}
