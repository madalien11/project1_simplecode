import 'package:flutter/material.dart';
import 'package:project1_simplecode/model/product_model.dart';

import '../../../../constants/app_text_styles.dart';
import '../../../../generated/l10n.dart';

class ProductCardText extends StatelessWidget {
  const ProductCardText({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          product.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.s16w500.copyWith(letterSpacing: 0.5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${S.of(context).price}: \$${product.price}',
              style: AppTextStyles.s12w400,
            ),
            Text(
              '${S.of(context).rating}: ${product.rating.rate}',
              style: AppTextStyles.s12w400,
            ),
          ],
        ),
      ],
    );
  }
}
