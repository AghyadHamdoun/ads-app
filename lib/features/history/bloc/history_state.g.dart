// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HistoryState extends HistoryState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final String? error;
  @override
  final HistoryModel? historyModel;

  factory _$HistoryState([void Function(HistoryStateBuilder)? updates]) =>
      (new HistoryStateBuilder()..update(updates))._build();

  _$HistoryState._(
      {this.isSuccess, this.isLoading, this.error, this.historyModel})
      : super._();

  @override
  HistoryState rebuild(void Function(HistoryStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HistoryStateBuilder toBuilder() => new HistoryStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HistoryState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        error == other.error &&
        historyModel == other.historyModel;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isSuccess.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, historyModel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HistoryState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('historyModel', historyModel))
        .toString();
  }
}

class HistoryStateBuilder
    implements Builder<HistoryState, HistoryStateBuilder> {
  _$HistoryState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  HistoryModel? _historyModel;
  HistoryModel? get historyModel => _$this._historyModel;
  set historyModel(HistoryModel? historyModel) =>
      _$this._historyModel = historyModel;

  HistoryStateBuilder();

  HistoryStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _error = $v.error;
      _historyModel = $v.historyModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HistoryState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HistoryState;
  }

  @override
  void update(void Function(HistoryStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HistoryState build() => _build();

  _$HistoryState _build() {
    final _$result = _$v ??
        new _$HistoryState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            error: error,
            historyModel: historyModel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
