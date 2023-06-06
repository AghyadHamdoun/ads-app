// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NotificationsState extends NotificationsState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final String? error;
  @override
  final NotificationsModel? notificationsModel;

  factory _$NotificationsState(
          [void Function(NotificationsStateBuilder)? updates]) =>
      (new NotificationsStateBuilder()..update(updates))._build();

  _$NotificationsState._(
      {this.isSuccess, this.isLoading, this.error, this.notificationsModel})
      : super._();

  @override
  NotificationsState rebuild(
          void Function(NotificationsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsStateBuilder toBuilder() =>
      new NotificationsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        error == other.error &&
        notificationsModel == other.notificationsModel;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isSuccess.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, notificationsModel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationsState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('notificationsModel', notificationsModel))
        .toString();
  }
}

class NotificationsStateBuilder
    implements Builder<NotificationsState, NotificationsStateBuilder> {
  _$NotificationsState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  NotificationsModel? _notificationsModel;
  NotificationsModel? get notificationsModel => _$this._notificationsModel;
  set notificationsModel(NotificationsModel? notificationsModel) =>
      _$this._notificationsModel = notificationsModel;

  NotificationsStateBuilder();

  NotificationsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _error = $v.error;
      _notificationsModel = $v.notificationsModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationsState;
  }

  @override
  void update(void Function(NotificationsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationsState build() => _build();

  _$NotificationsState _build() {
    final _$result = _$v ??
        new _$NotificationsState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            error: error,
            notificationsModel: notificationsModel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
