// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_us_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CallUsState extends CallUsState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final String? error;
  @override
  final MessageModel? messageModel;

  factory _$CallUsState([void Function(CallUsStateBuilder)? updates]) =>
      (new CallUsStateBuilder()..update(updates))._build();

  _$CallUsState._(
      {this.isSuccess, this.isLoading, this.error, this.messageModel})
      : super._();

  @override
  CallUsState rebuild(void Function(CallUsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CallUsStateBuilder toBuilder() => new CallUsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CallUsState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        error == other.error &&
        messageModel == other.messageModel;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isSuccess.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, messageModel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CallUsState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('messageModel', messageModel))
        .toString();
  }
}

class CallUsStateBuilder implements Builder<CallUsState, CallUsStateBuilder> {
  _$CallUsState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  MessageModel? _messageModel;
  MessageModel? get messageModel => _$this._messageModel;
  set messageModel(MessageModel? messageModel) =>
      _$this._messageModel = messageModel;

  CallUsStateBuilder();

  CallUsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _error = $v.error;
      _messageModel = $v.messageModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CallUsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CallUsState;
  }

  @override
  void update(void Function(CallUsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CallUsState build() => _build();

  _$CallUsState _build() {
    final _$result = _$v ??
        new _$CallUsState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            error: error,
            messageModel: messageModel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
