// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_details_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdsDetailsState extends AdsDetailsState {
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
  final AdsDetailsModel? adsDetailsModel;
  @override
  final MessageModel? messageModel;

  factory _$AdsDetailsState([void Function(AdsDetailsStateBuilder)? updates]) =>
      (new AdsDetailsStateBuilder()..update(updates))._build();

  _$AdsDetailsState._(
      {this.isSuccess,
      this.isLoading,
      this.isSuccessPost,
      this.isLoadingPost,
      this.error,
      this.adsDetailsModel,
      this.messageModel})
      : super._();

  @override
  AdsDetailsState rebuild(void Function(AdsDetailsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdsDetailsStateBuilder toBuilder() =>
      new AdsDetailsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdsDetailsState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        isSuccessPost == other.isSuccessPost &&
        isLoadingPost == other.isLoadingPost &&
        error == other.error &&
        adsDetailsModel == other.adsDetailsModel &&
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
    _$hash = $jc(_$hash, adsDetailsModel.hashCode);
    _$hash = $jc(_$hash, messageModel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AdsDetailsState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('isSuccessPost', isSuccessPost)
          ..add('isLoadingPost', isLoadingPost)
          ..add('error', error)
          ..add('adsDetailsModel', adsDetailsModel)
          ..add('messageModel', messageModel))
        .toString();
  }
}

class AdsDetailsStateBuilder
    implements Builder<AdsDetailsState, AdsDetailsStateBuilder> {
  _$AdsDetailsState? _$v;

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

  AdsDetailsModel? _adsDetailsModel;
  AdsDetailsModel? get adsDetailsModel => _$this._adsDetailsModel;
  set adsDetailsModel(AdsDetailsModel? adsDetailsModel) =>
      _$this._adsDetailsModel = adsDetailsModel;

  MessageModel? _messageModel;
  MessageModel? get messageModel => _$this._messageModel;
  set messageModel(MessageModel? messageModel) =>
      _$this._messageModel = messageModel;

  AdsDetailsStateBuilder();

  AdsDetailsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _isSuccessPost = $v.isSuccessPost;
      _isLoadingPost = $v.isLoadingPost;
      _error = $v.error;
      _adsDetailsModel = $v.adsDetailsModel;
      _messageModel = $v.messageModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdsDetailsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AdsDetailsState;
  }

  @override
  void update(void Function(AdsDetailsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AdsDetailsState build() => _build();

  _$AdsDetailsState _build() {
    final _$result = _$v ??
        new _$AdsDetailsState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            isSuccessPost: isSuccessPost,
            isLoadingPost: isLoadingPost,
            error: error,
            adsDetailsModel: adsDetailsModel,
            messageModel: messageModel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
