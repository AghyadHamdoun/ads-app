part of 'post_project_bloc.dart';

  abstract class PostProjectEvent extends Equatable {
  const PostProjectEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetTypesObjectsEvent extends PostProjectEvent {

}

class ChangeTypeEvent extends PostProjectEvent {
     final TypeModel type;
     const ChangeTypeEvent(this.type);
}

class ChangeObjectEvent extends PostProjectEvent {
  final TypeModel type;
  const ChangeObjectEvent(this.type);
}

class SetPostProjectEvent extends PostProjectEvent {
  final Map<String, Object> object;
  const SetPostProjectEvent({required this.object});
}



