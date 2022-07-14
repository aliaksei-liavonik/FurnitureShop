import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/features/products_screen/products_screen_cubit.dart';
import 'package:furniture_shop/features/products_screen/products_table_section.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsScreenCubit(
        cqrs: context.read(),
      )..fetch(),
      child: BlocBuilder<ProductsScreenCubit, ProductsScreenState>(
        builder: (context, state) {
          return state.map(
            ready: (state) => ProductsScreenBody(state: state),
            error: (state) => Center(
              child: Text('Error: ${state.error}'),
            ),
          );
        },
      ),
    );
  }
}

class ProductsScreenBody extends HookWidget {
  const ProductsScreenBody({
    Key? key,
    required this.state,
  }) : super(key: key);

  final ProductsScreenStateReady state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductsTableSection(
          state: state,
        ),
      ],
    );
  }
}
