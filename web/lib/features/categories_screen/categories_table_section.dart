import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/categories_screen/categories_screen_cubit.dart';
import 'package:furniture_shop/features/categories_screen/category_form_body/category_form_body.dart';
import 'package:furniture_shop/utils/app_dialog.dart';
import 'package:furniture_shop/utils/table_section.dart';

class CategoriesTableSection extends StatelessWidget {
  const CategoriesTableSection({
    Key? key,
    required this.state,
  }) : super(key: key);

  final CategoriesScreenStateReady state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoriesScreenCubit>();

    return TableSection<CategoryDTO>(
      title: 'Categories list',
      items: state.currentPageCategories,
      currentPage: state.currentPage,
      totalCount: state.totalCount,
      onPrevPressed: () => cubit.fetch(page: state.currentPage - 1),
      onNextPressed: () => cubit.fetch(page: state.currentPage + 1),
      createItemButtonLabel: 'Create new category',
      createItemPressed: () {
        AppDialog.show<CategoryDTO>(
          context: context,
          titleText: 'Create category form',
          child: const CategoryFormBody(),
        );
      },
      itemBuilder: (category) => _CategoryItem(
        category: category,
        onPressed: () {},
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    Key? key,
    required this.category,
    this.onPressed,
  }) : super(key: key);

  final CategoryDTO category;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          height: 100,
          child: Align(
            child: Text(category.name),
          ),
        ),
      ),
    );
  }
}
