// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateProfileState extends UpdateProfileState {
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
  final ProfileDetailsModel? profileDetailsModel;
  @override
  final MessageModel? messageModel;

  factory _$UpdateProfileState(
          [void Function(UpdateProfileStateBuilder)? updates]) =>
      (new UpdateProfileStateBuilder()..update(updates))._build();

  _$UpdateProfileState._(
      {this.isSuccess,
      this.isLoading,
      this.isSuccessPost,
      this.isLoadingPost,
      this.error,
      this.profileDetailsModel,
      this.messageModel})
      : super._();

  @override
  UpdateProfileState rebuild(
          void Function(UpdateProfileStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateProfileStateBuilder toBuilder() =>
      new UpdateProfileStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateProfileState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        isSuccessPost == other.isSuccessPost &&
        isLoadingPost == other.isLoadingPost &&
        error == other.error &&
        profileDetailsModel == other.profileDetailsModel &&
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
    _$hash = $jc(_$hash, profileDetailsModel.hashCode);
    _$hash = $jc(_$hash, messageModel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateProfileState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('isSuccessPost', isSuccessPost)
          ..add('isLoadingPost', isLoadingPost)
          ..add('error', error)
          ..add('profileDetailsModel', profileDetailsModel)
          ..add('messageModel', messageModel))
        .toString();
  }
}

class UpdateProfileStateBuilder
    implements Builder<UpdateProfileState, UpdateProfileStateBuilder> {
  _$UpdateProfileState? _$v;

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

  ProfileDetailsModel? _profileDetailsModel;
  ProfileDetailsModel? get profileDetailsModel => _$this._profileDetailsModel;
  set profileDetailsModel(ProfileDetailsModel? profileDetailsModel) =>
      _$this._profileDetailsModel = profileDetailsModel;

  MessageModel? _messageModel;
  MessageModel? get messageModel => _$this._messageModel;
  set messageModel(MessageModel? messageModel) =>
      _$this._messageModel = messageModel;

  UpdateProfileStateBuilder();

  UpdateProfileStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _isSuccessPost = $v.isSuccessPost;
      _isLoadingPost = $v.isLoadingPost;
      _error = $v.error;
      _profileDetailsModel = $v.profileDetailsModel;
      _messageModel = $v.messageModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateProfileState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateProfileState;
  }

  @override
  void update(void Function(UpdateProfileStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateProfileState build() => _build();

  _$UpdateProfileState _build() {
    final _$result = _$v ??
        new _$UpdateProfileState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            isSuccessPost: isSuccessPost,
            isLoadingPost: isLoadingPost,
            error: error,
            profileDetailsModel: profileDetailsModel,
            messageModel: messageModel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
