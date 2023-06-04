



import 'package:built_value/built_value.dart';
import '../../../core/model/message_model.dart';
import '../model/type_and_object_model.dart';



part 'post_project_state.g.dart';



abstract class PostProjectState implements Built<PostProjectState,
    PostProjectStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  bool? get isSuccessPost;
  bool? get isLoadingPost;
  String? get error;
  TypeModel? get type;
  TypeModel? get object;
  TypesAndObjectivesModel? get typesAndObjectivesModel;
  MessageModel? get messageModel;





  PostProjectState._();

  factory PostProjectState([void Function(PostProjectStateBuilder) updates]) = _$PostProjectState;

  factory PostProjectState.initial() {
    return PostProjectState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..isLoadingPost = false
      ..isSuccessPost = false
      ..error=''

    );
  }
}


