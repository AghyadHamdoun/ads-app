// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pages_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PagesState extends PagesState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final String? error;
  @override
  final int page;

  factory _$PagesState([void Function(PagesStateBuilder)? updates]) =>
      (new PagesStateBuilder()..update(updates))._build();

  _$PagesState._(
      {this.isSuccess, this.isLoading, this.error, required this.page})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(page, r'PagesState', 'page');
  }

  @override
  PagesState rebuild(void Function(PagesStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PagesStateBuilder toBuilder() => new PagesStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PagesState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        error == other.error &&
        page == other.page;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isSuccess.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PagesState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('page', page))
        .toString();
  }
}

class PagesStateBuilder implements Builder<PagesState, PagesStateBuilder> {
  _$PagesState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  PagesStateBuilder();

  PagesStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _error = $v.error;
      _page = $v.page;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PagesState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PagesState;
  }

  @override
  void update(void Function(PagesStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PagesState build() => _build();

  _$PagesState _build() {
    final _$result = _$v ??
        new _$PagesState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            error: error,
            page: BuiltValueNullFieldError.checkNotNull(
                page, r'PagesState', 'page'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
