// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LogInScreenState {
  bool get loading => throw _privateConstructorUsedError;
  bool get invalidCredentials => throw _privateConstructorUsedError;
  bool get networkError => throw _privateConstructorUsedError;
  bool get unknownError => throw _privateConstructorUsedError;
  String get errorText => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loading, bool invalidCredentials,
            bool networkError, bool unknownError, String errorText)
        ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool loading, bool invalidCredentials, bool networkError,
            bool unknownError, String errorText)?
        ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loading, bool invalidCredentials, bool networkError,
            bool unknownError, String errorText)?
        ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogInScreenReadyState value) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LogInScreenReadyState value)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogInScreenReadyState value)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LogInScreenStateCopyWith<LogInScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogInScreenStateCopyWith<$Res> {
  factory $LogInScreenStateCopyWith(
          LogInScreenState value, $Res Function(LogInScreenState) then) =
      _$LogInScreenStateCopyWithImpl<$Res>;
  $Res call(
      {bool loading,
      bool invalidCredentials,
      bool networkError,
      bool unknownError,
      String errorText});
}

/// @nodoc
class _$LogInScreenStateCopyWithImpl<$Res>
    implements $LogInScreenStateCopyWith<$Res> {
  _$LogInScreenStateCopyWithImpl(this._value, this._then);

  final LogInScreenState _value;
  // ignore: unused_field
  final $Res Function(LogInScreenState) _then;

  @override
  $Res call({
    Object? loading = freezed,
    Object? invalidCredentials = freezed,
    Object? networkError = freezed,
    Object? unknownError = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      invalidCredentials: invalidCredentials == freezed
          ? _value.invalidCredentials
          : invalidCredentials // ignore: cast_nullable_to_non_nullable
              as bool,
      networkError: networkError == freezed
          ? _value.networkError
          : networkError // ignore: cast_nullable_to_non_nullable
              as bool,
      unknownError: unknownError == freezed
          ? _value.unknownError
          : unknownError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorText: errorText == freezed
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$LogInScreenReadyStateCopyWith<$Res>
    implements $LogInScreenStateCopyWith<$Res> {
  factory _$$LogInScreenReadyStateCopyWith(_$LogInScreenReadyState value,
          $Res Function(_$LogInScreenReadyState) then) =
      __$$LogInScreenReadyStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool loading,
      bool invalidCredentials,
      bool networkError,
      bool unknownError,
      String errorText});
}

/// @nodoc
class __$$LogInScreenReadyStateCopyWithImpl<$Res>
    extends _$LogInScreenStateCopyWithImpl<$Res>
    implements _$$LogInScreenReadyStateCopyWith<$Res> {
  __$$LogInScreenReadyStateCopyWithImpl(_$LogInScreenReadyState _value,
      $Res Function(_$LogInScreenReadyState) _then)
      : super(_value, (v) => _then(v as _$LogInScreenReadyState));

  @override
  _$LogInScreenReadyState get _value => super._value as _$LogInScreenReadyState;

  @override
  $Res call({
    Object? loading = freezed,
    Object? invalidCredentials = freezed,
    Object? networkError = freezed,
    Object? unknownError = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_$LogInScreenReadyState(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      invalidCredentials: invalidCredentials == freezed
          ? _value.invalidCredentials
          : invalidCredentials // ignore: cast_nullable_to_non_nullable
              as bool,
      networkError: networkError == freezed
          ? _value.networkError
          : networkError // ignore: cast_nullable_to_non_nullable
              as bool,
      unknownError: unknownError == freezed
          ? _value.unknownError
          : unknownError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorText: errorText == freezed
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LogInScreenReadyState implements LogInScreenReadyState {
  const _$LogInScreenReadyState(
      {this.loading = false,
      this.invalidCredentials = false,
      this.networkError = false,
      this.unknownError = false,
      this.errorText = ''});

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool invalidCredentials;
  @override
  @JsonKey()
  final bool networkError;
  @override
  @JsonKey()
  final bool unknownError;
  @override
  @JsonKey()
  final String errorText;

  @override
  String toString() {
    return 'LogInScreenState.ready(loading: $loading, invalidCredentials: $invalidCredentials, networkError: $networkError, unknownError: $unknownError, errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogInScreenReadyState &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality()
                .equals(other.invalidCredentials, invalidCredentials) &&
            const DeepCollectionEquality()
                .equals(other.networkError, networkError) &&
            const DeepCollectionEquality()
                .equals(other.unknownError, unknownError) &&
            const DeepCollectionEquality().equals(other.errorText, errorText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(invalidCredentials),
      const DeepCollectionEquality().hash(networkError),
      const DeepCollectionEquality().hash(unknownError),
      const DeepCollectionEquality().hash(errorText));

  @JsonKey(ignore: true)
  @override
  _$$LogInScreenReadyStateCopyWith<_$LogInScreenReadyState> get copyWith =>
      __$$LogInScreenReadyStateCopyWithImpl<_$LogInScreenReadyState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loading, bool invalidCredentials,
            bool networkError, bool unknownError, String errorText)
        ready,
  }) {
    return ready(
        loading, invalidCredentials, networkError, unknownError, errorText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool loading, bool invalidCredentials, bool networkError,
            bool unknownError, String errorText)?
        ready,
  }) {
    return ready?.call(
        loading, invalidCredentials, networkError, unknownError, errorText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loading, bool invalidCredentials, bool networkError,
            bool unknownError, String errorText)?
        ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(
          loading, invalidCredentials, networkError, unknownError, errorText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogInScreenReadyState value) ready,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LogInScreenReadyState value)? ready,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogInScreenReadyState value)? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class LogInScreenReadyState implements LogInScreenState {
  const factory LogInScreenReadyState(
      {final bool loading,
      final bool invalidCredentials,
      final bool networkError,
      final bool unknownError,
      final String errorText}) = _$LogInScreenReadyState;

  @override
  bool get loading;
  @override
  bool get invalidCredentials;
  @override
  bool get networkError;
  @override
  bool get unknownError;
  @override
  String get errorText;
  @override
  @JsonKey(ignore: true)
  _$$LogInScreenReadyStateCopyWith<_$LogInScreenReadyState> get copyWith =>
      throw _privateConstructorUsedError;
}
