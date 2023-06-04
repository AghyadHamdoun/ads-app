// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_project_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PostProjectState extends PostProjectState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final bool? isSuccessPost;
  @override
  final bool? isLoadingPost;
  @override
  final String? error;
  @override
  final TypeModel? type;
  @override
  final TypeModel? object;
  @override
  final TypesAndObjectivesModel? typesAndObjectivesModel;
  @override
  final MessageModel? messageModel;

  factory _$PostProjectState(
          [void Function(PostProjectStateBuilder)? updates]) =>
      (new PostProjectStateBuilder()..update(updates))._build();

  _$PostProjectState._(
      {this.isSuccess,
      this.isLoading,
      this.isSuccessPost,
      this.isLoadingPost,
      this.error,
      this.type,
      this.object,
      this.typesAndObjectivesModel,
      this.messageModel})
      : super._();

  @override
  PostProjectState rebuild(void Function(PostProjectStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostProjectStateBuilder toBuilder() =>
      new PostProjectStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostProjectState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        isSuccessPost == other.isSuccessPost &&
        isLoadingPost == other.isLoadingPost &&
        error == other.error &&
        type == other.type &&
        object == other.object &&
        typesAndObjectivesModel == other.typesAndObjectivesModel &&
        messageModel == other.messageModel;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isSuccess.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, isSuccessPost.hashCode);
    _$hash = $jc(_$hash, isLoadingPost.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, object.hashCode);
    _$hash = $jc(_$hash, typesAndObjectivesModel.hashCode);
    _$hash = $jc(_$hash, messageModel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostProjectState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('isSuccessPost', isSuccessPost)
          ..add('isLoadingPost', isLoadingPost)
          ..add('error', error)
          ..add('type', type)
          ..add('object', object)
          ..add('typesAndObjectivesModel', typesAndObjectivesModel)
          ..add('messageModel', messageModel))
        .toString();
  }
}

class PostProjectStateBuilder
    implements Builder<PostProjectState, PostProjectStateBuilder> {
  _$PostProjectState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _isSuccessPost;
  bool? get isSuccessPost => _$this._isSuccessPost;
  set isSuccessPost(bool? isSuccessPost) =>
      _$this._isSuccessPost = isSuccessPost;

  bool? _isLoadingPost;
  bool? get isLoadingPost => _$this._isLoadingPost;
  set isLoadingPost(bool? isLoadingPost) =>
      _$this._isLoadingPost = isLoadingPost;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  TypeModel? _type;
  TypeModel? get type => _$this._type;
  set type(TypeModel? type) => _$this._type = type;

  TypeModel? _object;
  TypeModel? get object => _$this._object;
  set object(TypeModel? object) => _$this._object = object;

  TypesAndObjectivesModel? _typesAndObjectivesModel;
  TypesAndObjectivesModel? get typesAndObjectivesModel =>
      _$this._typesAndObjectivesModel;
  set typesAndObjectivesModel(
          TypesAndObjectivesModel? typesAndObjectivesModel) =>
      _$this._typesAndObjectivesModel = typesAndObjectivesModel;

  MessageModel? _messageModel;
  MessageModel? get messageModel => _$this._messageModel;
  set messageModel(MessageModel? messageModel) =>
      _$this._messageModel = messageModel;

  PostProjectStateBuilder();

  PostProjectStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _isSuccessPost = $v.isSuccessPost;
      _isLoadingPost = $v.isLoadingPost;
      _error = $v.error;
      _type = $v.type;
      _object = $v.object;
      _typesAndObjectivesModel = $v.typesAndObjectivesModel;
      _messageModel = $v.messageModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostProjectState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostProjectState;
  }

  @override
  void update(void Function(PostProjectStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostProjectState build() => _build();

  _$PostProjectState _build() {
    final _$result = _$v ??
        new _$PostProjectState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            isSuccessPost: isSuccessPost,
            isLoadingPost: isLoadingPost,
            error: error,
            type: type,
            object: object,
            typesAndObjectivesModel: typesAndObjectivesModel,
            messageModel: messageModel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
