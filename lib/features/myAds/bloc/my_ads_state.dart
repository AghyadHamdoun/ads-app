



import 'package:built_value/built_value.dart';
import '../../../core/model/message_model.dart';
import '../model/my_ads_model.dart';



part 'my_ads_state.g.dart';



abstract class MyAdsState implements Built<MyAdsState,
    MyAdsStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  bool? get isSuccessPost;
  bool? get isLoadingPost;
  String? get error;
  MyAdsModel? get myAdsModel;
  MessageModel? get messageModel;





  MyAdsState._();

  factory MyAdsState([void Function(MyAdsStateBuilder) updates]) = _$MyAdsState;

  factory MyAdsState.initial() {
    return MyAdsState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..isLoadingPost = false
      ..isSuccessPost = false
      ..error=''

    );
  }
}


