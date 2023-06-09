



import 'package:built_value/built_value.dart';
import '../../../core/model/message_model.dart';
import '../model/all_ads_model.dart';



part 'all_ads_state.g.dart';



abstract class AllAdsState implements Built<AllAdsState,
    AllAdsStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  bool? get isSuccessPost;
  bool? get isLoadingPost;
  String? get error;
  AllAdsModel? get allAdsModel;
  MessageModel? get messageModel;





  AllAdsState._();

  factory AllAdsState([void Function(AllAdsStateBuilder) updates]) = _$AllAdsState;

  factory AllAdsState.initial() {
    return AllAdsState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..isLoadingPost = false
      ..isSuccessPost = false
      ..error=''

    );
  }
}


