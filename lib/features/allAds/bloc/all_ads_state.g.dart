// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_ads_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AllAdsState extends AllAdsState {
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
  final AllAdsModel? allAdsModel;
  @override
  final MessageModel? messageModel;

  factory _$AllAdsState([void Function(AllAdsStateBuilder)? updates]) =>
      (new AllAdsStateBuilder()..update(updates))._build();

  _$AllAdsState._(
      {this.isSuccess,
      this.isLoading,
      this.isSuccessPost,
      this.isLoadingPost,
      this.error,
      this.allAdsModel,
      this.messageModel})
      : super._();

  @override
  AllAdsState rebuild(void Function(AllAdsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AllAdsStateBuilder toBuilder() => new AllAdsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AllAdsState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        isSuccessPost == other.isSuccessPost &&
        isLoadingPost == other.isLoadingPost &&
        error == other.error &&
        allAdsModel == other.allAdsModel &&
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
    _$hash = $jc(_$hash, allAdsModel.hashCode);
    _$hash = $jc(_$hash, messageModel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AllAdsState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('isSuccessPost', isSuccessPost)
          ..add('isLoadingPost', isLoadingPost)
          ..add('error', error)
          ..add('allAdsModel', allAdsModel)
          ..add('messageModel', messageModel))
        .toString();
  }
}

class AllAdsStateBuilder implements Builder<AllAdsState, AllAdsStateBuilder> {
  _$AllAdsState? _$v;

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

  AllAdsModel? _allAdsModel;
  AllAdsModel? get allAdsModel => _$this._allAdsModel;
  set allAdsModel(AllAdsModel? allAdsModel) =>
      _$this._allAdsModel = allAdsModel;

  MessageModel? _messageModel;
  MessageModel? get messageModel => _$this._messageModel;
  set messageModel(MessageModel? messageModel) =>
      _$this._messageModel = messageModel;

  AllAdsStateBuilder();

  AllAdsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _isSuccessPost = $v.isSuccessPost;
      _isLoadingPost = $v.isLoadingPost;
      _error = $v.error;
      _allAdsModel = $v.allAdsModel;
      _messageModel = $v.messageModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AllAdsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AllAdsState;
  }

  @override
  void update(void Function(AllAdsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AllAdsState build() => _build();

  _$AllAdsState _build() {
    final _$result = _$v ??
        new _$AllAdsState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            isSuccessPost: isSuccessPost,
            isLoadingPost: isLoadingPost,
            error: error,
            allAdsModel: allAdsModel,
            messageModel: messageModel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
