import 'package:bloc/bloc.dart';
import 'package:cqrs/cqrs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop/data/contracts.dart';

part 'shopping_cart_screen_cubit.freezed.dart';

const pageSize = 10;

final allCategories = CategoryDTO(id: 'all_categories_id', name: 'all');

class ShoppingCartScreenCubit extends Cubit<ShoppingCartScreenState> {
  ShoppingCartScreenCubit({
    required CQRS cqrs,
  })  : _cqrs = cqrs,
        super(const ShoppingCartScreenState.loading());

  final CQRS _cqrs;

  Future<void> fetch({int page = 0}) async {
    try {
      final categories = await _cqrs.get(AllCategories());
      final result = await _cqrs.get(ShoppingCart());

      if (result != null) {
        emit(
          ShoppingCartScreenState.ready(
            shoppingCartProducts: result.shoppingCartProducts
                .map(
                  (e) => SelectableShoppingCartProduct(
                    product: e,
                    count: 1,
                    selected: false,
                  ),
                )
                .toList(),
            categories: categories,
            activeCategory: allCategories,
          ),
        );
      } else {
        emit(const ShoppingCartScreenState.error(error: 'Could not load data'));
      }
    } catch (e) {
      emit(ShoppingCartScreenState.error(error: e.toString()));
    }
  }

  void changeActiveCategory(CategoryDTO activeCategory) {
    final state = this.state;
    if (state is! ShoppingCartScreenStateReady) {
      return;
    }

    emit(state.copyWith(activeCategory: activeCategory));
  }

  Future<void> removeProductFromShoppingCart(String productId) async {
    try {
      await _cqrs.run(RemoveProductFromShoppingCart(productId: productId));
      await fetch();
    } catch (e, _) {
      emit(ShoppingCartScreenState.error(error: e.toString()));
    }
  }

  Future<void> selectProduct({
    required String productId,
    required bool selected,
  }) async {
    final state = this.state;
    if (state is! ShoppingCartScreenStateReady) {
      return;
    }

    emit(
      state.copyWith(shoppingCartProducts: [
        for (final shoppingCartProduct in state.shoppingCartProducts)
          productId == shoppingCartProduct.product.product.id
              ? shoppingCartProduct.copyWith(selected: selected)
              : shoppingCartProduct
      ]),
    );
  }

  Future<void> changeCountOfProduct({
    required String productId,
    required int count,
  }) async {
    final state = this.state;
    if (state is! ShoppingCartScreenStateReady) {
      return;
    }

    emit(
      state.copyWith(shoppingCartProducts: [
        for (final shoppingCartProduct in state.shoppingCartProducts)
          productId == shoppingCartProduct.product.product.id
              ? shoppingCartProduct.copyWith(count: count)
              : shoppingCartProduct
      ]),
    );
  }
}

@freezed
class ShoppingCartScreenState with _$ShoppingCartScreenState {
  const factory ShoppingCartScreenState.loading() =
      ShoppingCartScreenStateLoading;
  const factory ShoppingCartScreenState.ready({
    required List<SelectableShoppingCartProduct> shoppingCartProducts,
    required CategoryDTO activeCategory,
    @Default(<bool>[]) List<bool> selectedProdcuts,
    @Default(<CategoryDTO>[]) List<CategoryDTO> categories,
    @Default(0) int currentPage,
    @Default(0) int totalCount,
  }) = ShoppingCartScreenStateReady;
  const factory ShoppingCartScreenState.error({
    required String error,
  }) = ShoppingCartScreenStateError;
}

@freezed
class SelectableShoppingCartProduct with _$SelectableShoppingCartProduct {
  const factory SelectableShoppingCartProduct({
    required ShoppingCartProductDTO product,
    required int count,
    required bool selected,
  }) = _SelectableShoppingCartProduct;
}
