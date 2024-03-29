import 'package:flutter/material.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/common/widgets/app_text_button.dart';
import 'package:furniture_shop/features/common/widgets/app_text_field.dart';
import 'package:furniture_shop/features/common/widgets/asset_icon.dart';
import 'package:furniture_shop/features/orders_screen/orders_screen.dart';
import 'package:furniture_shop/features/products_screen/filter_dialog.dart';
import 'package:furniture_shop/resources/app_colors.dart';
import 'package:furniture_shop/resources/app_text_styles.dart';
import 'package:furniture_shop/resources/assets.gen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.activeCategoryId,
    this.categories,
    this.withFilter = false,
    this.onChangeCategoryPressed,
    this.onSearchChanged,
  })  : assert(
          (categories != null &&
                  onChangeCategoryPressed != null &&
                  withFilter == true) ||
              categories == null &&
                  onChangeCategoryPressed == null &&
                  withFilter == false,
        ),
        super(key: key);

  final String title;
  final bool withFilter;

  final String? activeCategoryId;
  final List<CategoryDTO>? categories;
  final ValueChanged<CategoryDTO?>? onChangeCategoryPressed;
  final ValueChanged<String>? onSearchChanged;

  @override
  Widget build(BuildContext context) {
    void filterButtonPressed() {
      showFilterDialog<void>(
        context,
        categories: categories!,
        activeCategoryId: activeCategoryId,
        onChangeCategoryPressed: onChangeCategoryPressed!,
      );
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: AppColors.grey0,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                const Spacer(),
                Text(
                  title,
                  style: AppTextStyles.reg16,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: 16),
                    alignment: Alignment.centerRight,
                    child: Material(
                      color: AppColors.grey0,
                      shape: const CircleBorder(),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(24),
                        onTap: () {
                          Navigator.of(context).push(OrdersScreenRoute());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Assets.icons.list.svg(width: 24, height: 24),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (onSearchChanged != null) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Row(
                children: [
                  Flexible(
                    child: AppTextFormField(
                      hintText: 'Search',
                      onChanged: onSearchChanged,
                      prefix: AssetIcon(
                        asset: Assets.icons.loupe,
                      ),
                      backgroundColor: AppColors.white,
                    ),
                  ),
                  if (withFilter) ...[
                    const SizedBox(width: 12),
                    AppTextButton(
                      onPressed: filterButtonPressed,
                      background: AppColors.white,
                      withBorderSide: true,
                      child: Text(
                        'Filter',
                        style: AppTextStyles.reg12.copyWith(
                          color: AppColors.primaryText,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
