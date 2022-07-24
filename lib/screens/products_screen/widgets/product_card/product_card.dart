import 'package:flutter/material.dart';
import 'package:project1_simplecode/model/product_model.dart';
import 'package:project1_simplecode/screens/product_details_screen/product_details_screen.dart';

import 'product_card_text.dart';
import 'avatar_widget.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(
            product: product,
          ),
        ),
      ),
      child: Card(
        elevation: 2,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(flex: 2, child: ImageProductCard(url: product.image)),
            const SizedBox(width: 15),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                child: ProductCardText(product: product),
              ),
            ),
            const Icon(
              Icons.chevron_right_outlined,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
