// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'main_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainScreenState {
  MainScreenSection get currentSection => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MainScreenSection currentSection) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MainScreenSection currentSection)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MainScreenSection currentSection)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MainScreenReadyState value) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MainScreenReadyState value)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MainScreenReadyState value)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainScreenStateCopyWith<MainScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainScreenStateCopyWith<$Res> {
  factory $MainScreenStateCopyWith(
          MainScreenState value, $Res Function(MainScreenState) then) =
      _$MainScreenStateCopyWithImpl<$Res>;
  $Res call({MainScreenSection currentSection});
}

/// @nodoc
class _$MainScreenStateCopyWithImpl<$Res>
    implements $MainScreenStateCopyWith<$Res> {
  _$MainScreenStateCopyWithImpl(this._value, this._then);

  final MainScreenState _value;
  // ignore: unused_field
  final $Res Function(MainScreenState) _then;

  @override
  $Res call({
    Object? currentSection = freezed,
  }) {
    return _then(_value.copyWith(
      currentSection: currentSection == freezed
          ? _value.currentSection
          : currentSection // ignore: cast_nullable_to_non_nullable
              as MainScreenSection,
    ));
  }
}

/// @nodoc
abstract class _$$MainScreenReadyStateCopyWith<$Res>
    implements $MainScreenStateCopyWith<$Res> {
  factory _$$MainScreenReadyStateCopyWith(_$MainScreenReadyState value,
          $Res Function(_$MainScreenReadyState) then) =
      __$$MainScreenReadyStateCopyWithImpl<$Res>;
  @override
  $Res call({MainScreenSection currentSection});
}

/// @nodoc
class __$$MainScreenReadyStateCopyWithImpl<$Res>
    extends _$MainScreenStateCopyWithImpl<$Res>
    implements _$$MainScreenReadyStateCopyWith<$Res> {
  __$$MainScreenReadyStateCopyWithImpl(_$MainScreenReadyState _value,
      $Res Function(_$MainScreenReadyState) _then)
      : super(_value, (v) => _then(v as _$MainScreenReadyState));

  @override
  _$MainScreenReadyState get _value => super._value as _$MainScreenReadyState;

  @override
  $Res call({
    Object? currentSection = freezed,
  }) {
    return _then(_$MainScreenReadyState(
      currentSection: currentSection == freezed
          ? _value.currentSection
          : currentSection // ignore: cast_nullable_to_non_nullable
              as MainScreenSection,
    ));
  }
}

/// @nodoc

class _$MainScreenReadyState implements MainScreenReadyState {
  const _$MainScreenReadyState({required this.currentSection});

  @override
  final MainScreenSection currentSection;

  @override
  String toString() {
    return 'MainScreenState.ready(currentSection: $currentSection)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainScreenReadyState &&
            const DeepCollectionEquality()
                .equals(other.currentSection, currentSection));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(currentSection));

  @JsonKey(ignore: true)
  @override
  _$$MainScreenReadyStateCopyWith<_$MainScreenReadyState> get copyWith =>
      __$$MainScreenReadyStateCopyWithImpl<_$MainScreenReadyState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MainScreenSection currentSection) ready,
  }) {
    return ready(currentSection);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MainScreenSection currentSection)? ready,
  }) {
    return ready?.call(currentSection);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MainScreenSection currentSection)? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(currentSection);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MainScreenReadyState value) ready,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MainScreenReadyState value)? ready,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MainScreenReadyState value)? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class MainScreenReadyState implements MainScreenState {
  const factory MainScreenReadyState(
          {required final MainScreenSection currentSection}) =
      _$MainScreenReadyState;

  @override
  MainScreenSection get currentSection;
  @override
  @JsonKey(ignore: true)
  _$$MainScreenReadyStateCopyWith<_$MainScreenReadyState> get copyWith =>
      throw _privateConstructorUsedError;
}
