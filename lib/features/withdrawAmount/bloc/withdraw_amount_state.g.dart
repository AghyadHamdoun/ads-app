// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_amount_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WithdrawAmountState extends WithdrawAmountState {
  @override
  final bool? isSuccessPost;
  @override
  final bool? isLoadingPost;
  @override
  final String? error;
  @override
  final MessageModel? messageModel;

  factory _$WithdrawAmountState(
          [void Function(WithdrawAmountStateBuilder)? updates]) =>
      (new WithdrawAmountStateBuilder()..update(updates))._build();

  _$WithdrawAmountState._(
      {this.isSuccessPost, this.isLoadingPost, this.error, this.messageModel})
      : super._();

  @override
  WithdrawAmountState rebuild(
          void Function(WithdrawAmountStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WithdrawAmountStateBuilder toBuilder() =>
      new WithdrawAmountStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WithdrawAmountState &&
        isSuccessPost == other.isSuccessPost &&
        isLoadingPost == other.isLoadingPost &&
        error == other.error &&
        messageModel == other.messageModel;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isSuccessPost.hashCode);
    _$hash = $jc(_$hash, isLoadingPost.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, messageModel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WithdrawAmountState')
          ..add('isSuccessPost', isSuccessPost)
          ..add('isLoadingPost', isLoadingPost)
          ..add('error', error)
          ..add('messageModel', messageModel))
        .toString();
  }
}

class WithdrawAmountStateBuilder
    implements Builder<WithdrawAmountState, WithdrawAmountStateBuilder> {
  _$WithdrawAmountState? _$v;

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

  MessageModel? _messageModel;
  MessageModel? get messageModel => _$this._messageModel;
  set messageModel(MessageModel? messageModel) =>
      _$this._messageModel = messageModel;

  WithdrawAmountStateBuilder();

  WithdrawAmountStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccessPost = $v.isSuccessPost;
      _isLoadingPost = $v.isLoadingPost;
      _error = $v.error;
      _messageModel = $v.messageModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WithdrawAmountState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WithdrawAmountState;
  }

  @override
  void update(void Function(WithdrawAmountStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WithdrawAmountState build() => _build();

  _$WithdrawAmountState _build() {
    final _$result = _$v ??
        new _$WithdrawAmountState._(
            isSuccessPost: isSuccessPost,
            isLoadingPost: isLoadingPost,
            error: error,
            messageModel: messageModel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
