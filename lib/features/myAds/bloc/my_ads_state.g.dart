// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_ads_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MyAdsState extends MyAdsState {
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
  final MyAdsModel? myAdsModel;
  @override
  final MessageModel? messageModel;

  factory _$MyAdsState([void Function(MyAdsStateBuilder)? updates]) =>
      (new MyAdsStateBuilder()..update(updates))._build();

  _$MyAdsState._(
      {this.isSuccess,
      this.isLoading,
      this.isSuccessPost,
      this.isLoadingPost,
      this.error,
      this.myAdsModel,
      this.messageModel})
      : super._();

  @override
  MyAdsState rebuild(void Function(MyAdsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MyAdsStateBuilder toBuilder() => new MyAdsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MyAdsState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        isSuccessPost == other.isSuccessPost &&
        isLoadingPost == other.isLoadingPost &&
        error == other.error &&
        myAdsModel == other.myAdsModel &&
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
    _$hash = $jc(_$hash, myAdsModel.hashCode);
    _$hash = $jc(_$hash, messageModel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MyAdsState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('isSuccessPost', isSuccessPost)
          ..add('isLoadingPost', isLoadingPost)
          ..add('error', error)
          ..add('myAdsModel', myAdsModel)
          ..add('messageModel', messageModel))
        .toString();
  }
}

class MyAdsStateBuilder implements Builder<MyAdsState, MyAdsStateBuilder> {
  _$MyAdsState? _$v;

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

  MyAdsModel? _myAdsModel;
  MyAdsModel? get myAdsModel => _$this._myAdsModel;
  set myAdsModel(MyAdsModel? myAdsModel) => _$this._myAdsModel = myAdsModel;

  MessageModel? _messageModel;
  MessageModel? get messageModel => _$this._messageModel;
  set messageModel(MessageModel? messageModel) =>
      _$this._messageModel = messageModel;

  MyAdsStateBuilder();

  MyAdsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _isSuccessPost = $v.isSuccessPost;
      _isLoadingPost = $v.isLoadingPost;
      _error = $v.error;
      _myAdsModel = $v.myAdsModel;
      _messageModel = $v.messageModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MyAdsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MyAdsState;
  }

  @override
  void update(void Function(MyAdsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MyAdsState build() => _build();

  _$MyAdsState _build() {
    final _$result = _$v ??
        new _$MyAdsState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            isSuccessPost: isSuccessPost,
            isLoadingPost: isLoadingPost,
            error: error,
            myAdsModel: myAdsModel,
            messageModel: messageModel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
