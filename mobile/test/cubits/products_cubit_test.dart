import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furniture_shop/cqrs/app_cqrs.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/products_screen/products_screen_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../test_data.dart';

class MockAppCQRS extends Mock implements AppCQRS {}

void main() {
  group(
    'ProductsScreenCubit',
    () {
      late MockAppCQRS cqrs;

      setUpAll(() {
        registerFallbackValue(AllCategories());
        registerFallbackValue(
          AllProducts(
            sortByDescending: false,
            pageSize: 10,
            pageNumber: 0,
          ),
        );
      });

      setUp(() {
        cqrs = MockAppCQRS();
      });

      ProductsScreenCubit buildCubit() => ProductsScreenCubit(
            cqrs: cqrs,
          );

      blocTest<ProductsScreenCubit, ProductsScreenState>(
        'emit initial ProductsScreenState on the start',
        build: buildCubit,
        verify: (cubit) => expect(
          cubit.state,
          const ProductsScreenReadyState(),
        ),
      );

      blocTest<ProductsScreenCubit, ProductsScreenState>(
        'run changeActiveCategory',
        build: buildCubit,
        act: (cubit) => cubit.changeActiveCategory(category1Test),
        verify: (cubit) => expect(
          cubit.state,
          ProductsScreenReadyState(activeCategory: category1Test),
        ),
      );

      blocTest<ProductsScreenCubit, ProductsScreenState>(
        'run fetch successfully',
        build: () {
          when(
            () => cqrs.get<List<CategoryDTO>>(any(that: isA<AllCategories>())),
          ).thenAnswer((_) async => []);
          when(
            () => cqrs.get<PaginatedResult<ProductDTO>>(
              any(that: isA<AllProducts>()),
            ),
          ).thenAnswer(
            (_) async => PaginatedResult(items: [], totalCount: 0),
          );
          return buildCubit();
        },
        act: (cubit) => cubit.fetch(),
        expect: () => [
          const ProductsScreenReadyState(isLoading: true),
          const ProductsScreenReadyState(
            products: {},
            totalCount: 0,
            currentPage: 0,
            categories: [],
          ),
        ],
      );

      blocTest<ProductsScreenCubit, ProductsScreenState>(
        'run fetch unsuccessfully',
        build: () {
          when(
            () => cqrs.get<List<CategoryDTO>>(any(that: isA<AllCategories>())),
          ).thenThrow(Exception(''));

          when(
            () => cqrs.get<PaginatedResult<ProductDTO>>(
              any(that: isA<AllProducts>()),
            ),
          ).thenThrow(Exception(''));

          return buildCubit();
        },
        act: (cubit) => cubit.fetch(),
        expect: () => [
          const ProductsScreenReadyState(isLoading: true),
          const ProductsScreenErrorState(errorMessage: 'Exception: '),
        ],
      );

      blocTest<ProductsScreenCubit, ProductsScreenState>(
        'run fetch for 2 pages successfully',
        build: () {
          when(
            () => cqrs.get<List<CategoryDTO>>(any(that: isA<AllCategories>())),
          ).thenAnswer((_) async => []);

          when(
            () => cqrs.get<PaginatedResult<ProductDTO>>(
              any(that: isA<AllProducts>()),
            ),
          ).thenAnswer(
            (_) async =>
                PaginatedResult(items: [productDTO1Test], totalCount: 2),
          );

          return buildCubit();
        },
        act: (cubit) async {
          await cubit.fetch();
          await cubit.fetch(productsPage: 1);
        },
        expect: () => [
          const ProductsScreenReadyState(isLoading: true),
          ProductsScreenReadyState(
            products: {productDTO1Test.id: productDTO1Test},
            totalCount: 2,
            currentPage: 0,
            categories: [],
          ),
          ProductsScreenReadyState(
            isLoading: true,
            products: {productDTO1Test.id: productDTO1Test},
            totalCount: 2,
          ),
          ProductsScreenReadyState(
            products: {productDTO1Test.id: productDTO1Test},
            totalCount: 2,
            currentPage: 1,
            categories: [],
          ),
        ],
      );
    },
  );
}
