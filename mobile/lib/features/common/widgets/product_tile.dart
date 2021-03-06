import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/resources/app_colors.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.product,
    this.children = const [],
  }) : super(key: key);

  final ProductDTO product;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    void _productTilePressed() {}

    return InkWell(
      onTap: _productTilePressed,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.grey3),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CachedNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl:
                        'https://e7.pngegg.com/pngimages/952/954/png-clipart-table-wood-furniture-table-angle-rectangle.png',
                    errorWidget: (context, url, dynamic error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(width: 28),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.productInfo.name),
                    AvaregeScore(
                        rating: product.productInfo.averageRating ??
                            0), // get from product
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: children,
                          // [
                          //   if (productLikeClicked != null)
                          //     InkWell(
                          //       onTap: productLikeClicked,
                          //       child: product.productInfo.inFavourites
                          //           ? Assets.icons.selectedHeart.image()
                          //           : Assets.icons.heart.image(),
                          //     ),
                          //   if (productShoppingCartClicked != null) ...[
                          //     const SizedBox(width: 12),
                          //     InkWell(
                          //       onTap: productShoppingCartClicked,
                          //       child: product.productInfo.inShoppingCart
                          //           ? Assets.icons.selectedAddToCart.image()
                          //           : Assets.icons.addToCart.image(),
                          //     ),
                          //   ],
                          // ],
                        ),
                        Text(
                          product.productInfo.price.toString() + '\$',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Text(product.productInfo.description),
            const UserComment(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class AvaregeScore extends StatelessWidget {
  const AvaregeScore({
    Key? key,
    required this.rating,
  }) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemSize: 26,
      unratedColor: Colors.amber.withAlpha(50),
    );
  }
}

class UserComment extends StatelessWidget {
  const UserComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
