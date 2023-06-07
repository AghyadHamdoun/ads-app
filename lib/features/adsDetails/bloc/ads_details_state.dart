import 'package:built_value/built_value.dart';
import '../../../core/model/message_model.dart';
import '../model/ads_details_model.dart';



part 'ads_details_state.g.dart';



abstract class AdsDetailsState implements Built<AdsDetailsState,
    AdsDetailsStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  bool? get isSuccessPost;
  bool? get isLoadingPost;
  String? get error;
  AdsDetailsModel? get adsDetailsModel;
  MessageModel? get messageModel;





  AdsDetailsState._();

  factory AdsDetailsState([void Function(AdsDetailsStateBuilder) updates]) = _$AdsDetailsState;

  factory AdsDetailsState.initial() {
    return AdsDetailsState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..isLoadingPost = false
      ..isSuccessPost = false
      ..error=''

    );
  }
}


