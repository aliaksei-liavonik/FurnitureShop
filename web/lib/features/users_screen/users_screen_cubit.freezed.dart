// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'users_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UsersScreenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, UserInfoDTO> users, int currentPage, int totalCount)
        ready,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Map<String, UserInfoDTO> users, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Map<String, UserInfoDTO> users, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UsersScreenStateReady value) ready,
    required TResult Function(UsersScreenStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UsersScreenStateReady value)? ready,
    TResult Function(UsersScreenStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersScreenStateReady value)? ready,
    TResult Function(UsersScreenStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersScreenStateCopyWith<$Res> {
  factory $UsersScreenStateCopyWith(
          UsersScreenState value, $Res Function(UsersScreenState) then) =
      _$UsersScreenStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UsersScreenStateCopyWithImpl<$Res>
    implements $UsersScreenStateCopyWith<$Res> {
  _$UsersScreenStateCopyWithImpl(this._value, this._then);

  final UsersScreenState _value;
  // ignore: unused_field
  final $Res Function(UsersScreenState) _then;
}

/// @nodoc
abstract class _$$UsersScreenStateReadyCopyWith<$Res> {
  factory _$$UsersScreenStateReadyCopyWith(_$UsersScreenStateReady value,
          $Res Function(_$UsersScreenStateReady) then) =
      __$$UsersScreenStateReadyCopyWithImpl<$Res>;
  $Res call({Map<String, UserInfoDTO> users, int currentPage, int totalCount});
}

/// @nodoc
class __$$UsersScreenStateReadyCopyWithImpl<$Res>
    extends _$UsersScreenStateCopyWithImpl<$Res>
    implements _$$UsersScreenStateReadyCopyWith<$Res> {
  __$$UsersScreenStateReadyCopyWithImpl(_$UsersScreenStateReady _value,
      $Res Function(_$UsersScreenStateReady) _then)
      : super(_value, (v) => _then(v as _$UsersScreenStateReady));

  @override
  _$UsersScreenStateReady get _value => super._value as _$UsersScreenStateReady;

  @override
  $Res call({
    Object? users = freezed,
    Object? currentPage = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_$UsersScreenStateReady(
      users: users == freezed
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as Map<String, UserInfoDTO>,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UsersScreenStateReady implements UsersScreenStateReady {
  const _$UsersScreenStateReady(
      {final Map<String, UserInfoDTO> users = const <String, UserInfoDTO>{},
      this.currentPage = 0,
      this.totalCount = 0})
      : _users = users;

  final Map<String, UserInfoDTO> _users;
  @override
  @JsonKey()
  Map<String, UserInfoDTO> get users {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_users);
  }

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int totalCount;

  @override
  String toString() {
    return 'UsersScreenState.ready(users: $users, currentPage: $currentPage, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersScreenStateReady &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality()
                .equals(other.totalCount, totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(totalCount));

  @JsonKey(ignore: true)
  @override
  _$$UsersScreenStateReadyCopyWith<_$UsersScreenStateReady> get copyWith =>
      __$$UsersScreenStateReadyCopyWithImpl<_$UsersScreenStateReady>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, UserInfoDTO> users, int currentPage, int totalCount)
        ready,
    required TResult Function(String error) error,
  }) {
    return ready(users, currentPage, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Map<String, UserInfoDTO> users, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) {
    return ready?.call(users, currentPage, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Map<String, UserInfoDTO> users, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(users, currentPage, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UsersScreenStateReady value) ready,
    required TResult Function(UsersScreenStateError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UsersScreenStateReady value)? ready,
    TResult Function(UsersScreenStateError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersScreenStateReady value)? ready,
    TResult Function(UsersScreenStateError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class UsersScreenStateReady implements UsersScreenState {
  const factory UsersScreenStateReady(
      {final Map<String, UserInfoDTO> users,
      final int currentPage,
      final int totalCount}) = _$UsersScreenStateReady;

  Map<String, UserInfoDTO> get users;
  int get currentPage;
  int get totalCount;
  @JsonKey(ignore: true)
  _$$UsersScreenStateReadyCopyWith<_$UsersScreenStateReady> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UsersScreenStateErrorCopyWith<$Res> {
  factory _$$UsersScreenStateErrorCopyWith(_$UsersScreenStateError value,
          $Res Function(_$UsersScreenStateError) then) =
      __$$UsersScreenStateErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$$UsersScreenStateErrorCopyWithImpl<$Res>
    extends _$UsersScreenStateCopyWithImpl<$Res>
    implements _$$UsersScreenStateErrorCopyWith<$Res> {
  __$$UsersScreenStateErrorCopyWithImpl(_$UsersScreenStateError _value,
      $Res Function(_$UsersScreenStateError) _then)
      : super(_value, (v) => _then(v as _$UsersScreenStateError));

  @override
  _$UsersScreenStateError get _value => super._value as _$UsersScreenStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$UsersScreenStateError(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UsersScreenStateError implements UsersScreenStateError {
  const _$UsersScreenStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'UsersScreenState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersScreenStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$UsersScreenStateErrorCopyWith<_$UsersScreenStateError> get copyWith =>
      __$$UsersScreenStateErrorCopyWithImpl<_$UsersScreenStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, UserInfoDTO> users, int currentPage, int totalCount)
        ready,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Map<String, UserInfoDTO> users, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Map<String, UserInfoDTO> users, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UsersScreenStateReady value) ready,
    required TResult Function(UsersScreenStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UsersScreenStateReady value)? ready,
    TResult Function(UsersScreenStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersScreenStateReady value)? ready,
    TResult Function(UsersScreenStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class UsersScreenStateError implements UsersScreenState {
  const factory UsersScreenStateError({required final String error}) =
      _$UsersScreenStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$UsersScreenStateErrorCopyWith<_$UsersScreenStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
