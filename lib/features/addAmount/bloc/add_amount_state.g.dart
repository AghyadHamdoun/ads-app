// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_amount_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddAmountState extends AddAmountState {
  @override
  final bool? isSuccessPost;
  @override
  final bool? isLoadingPost;
  @override
  final String? error;
  @override
  final MessageModel? messageModel;

  factory _$AddAmountState([void Function(AddAmountStateBuilder)? updates]) =>
      (new AddAmountStateBuilder()..update(updates))._build();

  _$AddAmountState._(
      {this.isSuccessPost, this.isLoadingPost, this.error, this.messageModel})
      : super._();

  @override
  AddAmountState rebuild(void Function(AddAmountStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddAmountStateBuilder toBuilder() =>
      new AddAmountStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddAmountState &&
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
    return (newBuiltValueToStringHelper(r'AddAmountState')
          ..add('isSuccessPost', isSuccessPost)
          ..add('isLoadingPost', isLoadingPost)
          ..add('error', error)
          ..add('messageModel', messageModel))
        .toString();
  }
}

class AddAmountStateBuilder
    implements Builder<AddAmountState, AddAmountStateBuilder> {
  _$AddAmountState? _$v;

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

  AddAmountStateBuilder();

  AddAmountStateBuilder get _$this {
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
  void replace(AddAmountState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddAmountState;
  }

  @override
  void update(void Function(AddAmountStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddAmountState build() => _build();

  _$AddAmountState _build() {
    final _$result = _$v ??
        new _$AddAmountState._(
            isSuccessPost: isSuccessPost,
            isLoadingPost: isLoadingPost,
            error: error,
            messageModel: messageModel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
