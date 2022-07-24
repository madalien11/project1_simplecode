import 'package:flutter/material.dart';
import 'package:project1_simplecode/model/product_model.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../generated/l10n.dart';
import 'widget/stars_builder.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).productDetails,
          style: AppTextStyles.s20w500,
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.65,
            width: double.maxFinite,
            child: Image.network(
              product.image,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox.expand(
            child: DraggableScrollableSheet(
              initialChildSize: 1.0,
              maxChildSize: 1,
              minChildSize: 0.99,
              builder: ((context, scrollController) => ListView(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    children: <Widget>[
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).scaffoldBackgroundColor,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ]),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              product.title,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.s16w500,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.lightGrey,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 6, 10, 6),
                                  child: Text(
                                    '\$${product.price}',
                                    style: AppTextStyles.s14w500.copyWith(
                                      color: AppColors.darkText,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                starsBuilder(product.rating.rate),
                                Text(
                                  '  ${product.rating.rate} (${product.rating.count})',
                                  style: AppTextStyles.s14w500,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              product.description,
                              textAlign: TextAlign.justify,
                              style: AppTextStyles.productDescription,
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
