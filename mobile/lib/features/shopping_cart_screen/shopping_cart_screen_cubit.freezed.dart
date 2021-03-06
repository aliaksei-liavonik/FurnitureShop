// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shopping_cart_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ShoppingCartScreenStateTearOff {
  const _$ShoppingCartScreenStateTearOff();

  ShoppingCartLoadingState loading() {
    return const ShoppingCartLoadingState();
  }

  ShoppingCartReadyState ready(
      {required ShoppingCartDTO shoppingCart,
      required CategoryDTO activeCategory,
      List<CategoryDTO> categories = const <CategoryDTO>[],
      int currentPage = 0,
      int totalCount = 0}) {
    return ShoppingCartReadyState(
      shoppingCart: shoppingCart,
      activeCategory: activeCategory,
      categories: categories,
      currentPage: currentPage,
      totalCount: totalCount,
    );
  }

  ShoppingCartErrorState error({required String error}) {
    return ShoppingCartErrorState(
      error: error,
    );
  }
}

/// @nodoc
const $ShoppingCartScreenState = _$ShoppingCartScreenStateTearOff();

/// @nodoc
mixin _$ShoppingCartScreenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            ShoppingCartDTO shoppingCart,
            CategoryDTO activeCategory,
            List<CategoryDTO> categories,
            int currentPage,
            int totalCount)
        ready,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ShoppingCartDTO shoppingCart, CategoryDTO activeCategory,
            List<CategoryDTO> categories, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ShoppingCartDTO shoppingCart, CategoryDTO activeCategory,
            List<CategoryDTO> categories, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShoppingCartLoadingState value) loading,
    required TResult Function(ShoppingCartReadyState value) ready,
    required TResult Function(ShoppingCartErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShoppingCartLoadingState value)? loading,
    TResult Function(ShoppingCartReadyState value)? ready,
    TResult Function(ShoppingCartErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShoppingCartLoadingState value)? loading,
    TResult Function(ShoppingCartReadyState value)? ready,
    TResult Function(ShoppingCartErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingCartScreenStateCopyWith<$Res> {
  factory $ShoppingCartScreenStateCopyWith(ShoppingCartScreenState value,
          $Res Function(ShoppingCartScreenState) then) =
      _$ShoppingCartScreenStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShoppingCartScreenStateCopyWithImpl<$Res>
    implements $ShoppingCartScreenStateCopyWith<$Res> {
  _$ShoppingCartScreenStateCopyWithImpl(this._value, this._then);

  final ShoppingCartScreenState _value;
  // ignore: unused_field
  final $Res Function(ShoppingCartScreenState) _then;
}

/// @nodoc
abstract class $ShoppingCartLoadingStateCopyWith<$Res> {
  factory $ShoppingCartLoadingStateCopyWith(ShoppingCartLoadingState value,
          $Res Function(ShoppingCartLoadingState) then) =
      _$ShoppingCartLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShoppingCartLoadingStateCopyWithImpl<$Res>
    extends _$ShoppingCartScreenStateCopyWithImpl<$Res>
    implements $ShoppingCartLoadingStateCopyWith<$Res> {
  _$ShoppingCartLoadingStateCopyWithImpl(ShoppingCartLoadingState _value,
      $Res Function(ShoppingCartLoadingState) _then)
      : super(_value, (v) => _then(v as ShoppingCartLoadingState));

  @override
  ShoppingCartLoadingState get _value =>
      super._value as ShoppingCartLoadingState;
}

/// @nodoc

class _$ShoppingCartLoadingState implements ShoppingCartLoadingState {
  const _$ShoppingCartLoadingState();

  @override
  String toString() {
    return 'ShoppingCartScreenState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ShoppingCartLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            ShoppingCartDTO shoppingCart,
            CategoryDTO activeCategory,
            List<CategoryDTO> categories,
            int currentPage,
            int totalCount)
        ready,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ShoppingCartDTO shoppingCart, CategoryDTO activeCategory,
            List<CategoryDTO> categories, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ShoppingCartDTO shoppingCart, CategoryDTO activeCategory,
            List<CategoryDTO> categories, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShoppingCartLoadingState value) loading,
    required TResult Function(ShoppingCartReadyState value) ready,
    required TResult Function(ShoppingCartErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShoppingCartLoadingState value)? loading,
    TResult Function(ShoppingCartReadyState value)? ready,
    TResult Function(ShoppingCartErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShoppingCartLoadingState value)? loading,
    TResult Function(ShoppingCartReadyState value)? ready,
    TResult Function(ShoppingCartErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ShoppingCartLoadingState implements ShoppingCartScreenState {
  const factory ShoppingCartLoadingState() = _$ShoppingCartLoadingState;
}

/// @nodoc
abstract class $ShoppingCartReadyStateCopyWith<$Res> {
  factory $ShoppingCartReadyStateCopyWith(ShoppingCartReadyState value,
          $Res Function(ShoppingCartReadyState) then) =
      _$ShoppingCartReadyStateCopyWithImpl<$Res>;
  $Res call(
      {ShoppingCartDTO shoppingCart,
      CategoryDTO activeCategory,
      List<CategoryDTO> categories,
      int currentPage,
      int totalCount});
}

/// @nodoc
class _$ShoppingCartReadyStateCopyWithImpl<$Res>
    extends _$ShoppingCartScreenStateCopyWithImpl<$Res>
    implements $ShoppingCartReadyStateCopyWith<$Res> {
  _$ShoppingCartReadyStateCopyWithImpl(ShoppingCartReadyState _value,
      $Res Function(ShoppingCartReadyState) _then)
      : super(_value, (v) => _then(v as ShoppingCartReadyState));

  @override
  ShoppingCartReadyState get _value => super._value as ShoppingCartReadyState;

  @override
  $Res call({
    Object? shoppingCart = freezed,
    Object? activeCategory = freezed,
    Object? categories = freezed,
    Object? currentPage = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(ShoppingCartReadyState(
      shoppingCart: shoppingCart == freezed
          ? _value.shoppingCart
          : shoppingCart // ignore: cast_nullable_to_non_nullable
              as ShoppingCartDTO,
      activeCategory: activeCategory == freezed
          ? _value.activeCategory
          : activeCategory // ignore: cast_nullable_to_non_nullable
              as CategoryDTO,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDTO>,
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

class _$ShoppingCartReadyState implements ShoppingCartReadyState {
  const _$ShoppingCartReadyState(
      {required this.shoppingCart,
      required this.activeCategory,
      this.categories = const <CategoryDTO>[],
      this.currentPage = 0,
      this.totalCount = 0});

  @override
  final ShoppingCartDTO shoppingCart;
  @override
  final CategoryDTO activeCategory;
  @JsonKey()
  @override
  final List<CategoryDTO> categories;
  @JsonKey()
  @override
  final int currentPage;
  @JsonKey()
  @override
  final int totalCount;

  @override
  String toString() {
    return 'ShoppingCartScreenState.ready(shoppingCart: $shoppingCart, activeCategory: $activeCategory, categories: $categories, currentPage: $currentPage, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShoppingCartReadyState &&
            const DeepCollectionEquality()
                .equals(other.shoppingCart, shoppingCart) &&
            const DeepCollectionEquality()
                .equals(other.activeCategory, activeCategory) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality()
                .equals(other.totalCount, totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(shoppingCart),
      const DeepCollectionEquality().hash(activeCategory),
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(totalCount));

  @JsonKey(ignore: true)
  @override
  $ShoppingCartReadyStateCopyWith<ShoppingCartReadyState> get copyWith =>
      _$ShoppingCartReadyStateCopyWithImpl<ShoppingCartReadyState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            ShoppingCartDTO shoppingCart,
            CategoryDTO activeCategory,
            List<CategoryDTO> categories,
            int currentPage,
            int totalCount)
        ready,
    required TResult Function(String error) error,
  }) {
    return ready(
        shoppingCart, activeCategory, categories, currentPage, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ShoppingCartDTO shoppingCart, CategoryDTO activeCategory,
            List<CategoryDTO> categories, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) {
    return ready?.call(
        shoppingCart, activeCategory, categories, currentPage, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ShoppingCartDTO shoppingCart, CategoryDTO activeCategory,
            List<CategoryDTO> categories, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(
          shoppingCart, activeCategory, categories, currentPage, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShoppingCartLoadingState value) loading,
    required TResult Function(ShoppingCartReadyState value) ready,
    required TResult Function(ShoppingCartErrorState value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShoppingCartLoadingState value)? loading,
    TResult Function(ShoppingCartReadyState value)? ready,
    TResult Function(ShoppingCartErrorState value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShoppingCartLoadingState value)? loading,
    TResult Function(ShoppingCartReadyState value)? ready,
    TResult Function(ShoppingCartErrorState value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class ShoppingCartReadyState implements ShoppingCartScreenState {
  const factory ShoppingCartReadyState(
      {required ShoppingCartDTO shoppingCart,
      required CategoryDTO activeCategory,
      List<CategoryDTO> categories,
      int currentPage,
      int totalCount}) = _$ShoppingCartReadyState;

  ShoppingCartDTO get shoppingCart;
  CategoryDTO get activeCategory;
  List<CategoryDTO> get categories;
  int get currentPage;
  int get totalCount;
  @JsonKey(ignore: true)
  $ShoppingCartReadyStateCopyWith<ShoppingCartReadyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingCartErrorStateCopyWith<$Res> {
  factory $ShoppingCartErrorStateCopyWith(ShoppingCartErrorState value,
          $Res Function(ShoppingCartErrorState) then) =
      _$ShoppingCartErrorStateCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$ShoppingCartErrorStateCopyWithImpl<$Res>
    extends _$ShoppingCartScreenStateCopyWithImpl<$Res>
    implements $ShoppingCartErrorStateCopyWith<$Res> {
  _$ShoppingCartErrorStateCopyWithImpl(ShoppingCartErrorState _value,
      $Res Function(ShoppingCartErrorState) _then)
      : super(_value, (v) => _then(v as ShoppingCartErrorState));

  @override
  ShoppingCartErrorState get _value => super._value as ShoppingCartErrorState;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(ShoppingCartErrorState(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShoppingCartErrorState implements ShoppingCartErrorState {
  const _$ShoppingCartErrorState({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ShoppingCartScreenState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShoppingCartErrorState &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $ShoppingCartErrorStateCopyWith<ShoppingCartErrorState> get copyWith =>
      _$ShoppingCartErrorStateCopyWithImpl<ShoppingCartErrorState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            ShoppingCartDTO shoppingCart,
            CategoryDTO activeCategory,
            List<CategoryDTO> categories,
            int currentPage,
            int totalCount)
        ready,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ShoppingCartDTO shoppingCart, CategoryDTO activeCategory,
            List<CategoryDTO> categories, int currentPage, int totalCount)?
        ready,
    TResult Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ShoppingCartDTO shoppingCart, CategoryDTO activeCategory,
            List<CategoryDTO> categories, int currentPage, int totalCount)?
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
    required TResult Function(ShoppingCartLoadingState value) loading,
    required TResult Function(ShoppingCartReadyState value) ready,
    required TResult Function(ShoppingCartErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ShoppingCartLoadingState value)? loading,
    TResult Function(ShoppingCartReadyState value)? ready,
    TResult Function(ShoppingCartErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShoppingCartLoadingState value)? loading,
    TResult Function(ShoppingCartReadyState value)? ready,
    TResult Function(ShoppingCartErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ShoppingCartErrorState implements ShoppingCartScreenState {
  const factory ShoppingCartErrorState({required String error}) =
      _$ShoppingCartErrorState;

  String get error;
  @JsonKey(ignore: true)
  $ShoppingCartErrorStateCopyWith<ShoppingCartErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
