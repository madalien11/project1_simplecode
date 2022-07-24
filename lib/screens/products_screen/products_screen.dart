import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1_simplecode/model/product_model.dart';

import '../../bloc/categories_bloc/categories_bloc.dart';
import '../../bloc/products_bloc/products_bloc.dart';
import '../../constants/app_button_styles.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../generated/l10n.dart';
import '../../widgets/nav_bar.dart';
import 'widgets/product_card/product_card.dart';
import 'widgets/sort_and_filter/sort_and_filter.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);

  final List<ProductModel> products = [];
  final List<String> categories = [
    'all',
    "electronics",
    "jewelery",
    "men's clothings",
    "women's clothings",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const NavBar(current: 0),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              children: [
                const SortSelectWidget(),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: BlocBuilder<CategoriesBloc, CategoriesState>(
                        builder: (context, state) {
                          if (state is CategoriesData) {
                            categories.clear();
                            categories.add('all');
                            categories.addAll(state.categories);
                          }
                          return CategoryFilterWidget(categories: categories);
                        },
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Expanded(child: RatingFilterWidget()),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: BlocBuilder<ProductsBloc, ProductsState>(
                    builder: ((context, state) {
                      if (state is ProductsLoading) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [CircularProgressIndicator()],
                        );
                      } else if (state is ProductsError) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(child: Text(state.error)),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              style: AppButtonStyles.elevated,
                              onPressed: () {
                                BlocProvider.of<ProductsBloc>(context).add(
                                  ProductsSortEvent(
                                    isDesc: false,
                                    category: 'all',
                                    rating: 'all',
                                  ),
                                );
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: Text(
                                  S.of(context).tryAgain,
                                  style: AppTextStyles.s16w400.copyWith(
                                    color: AppColors.lightText,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else if (state is ProductsData) {
                        products.clear();
                        products.addAll(state.data);
                      }

                      if (products.isEmpty) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                S.of(context).productsListIsEmpty,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return GridView.count(
                          crossAxisCount: 1,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 16,
                          childAspectRatio: 3,
                          children: products
                              .map(
                                (e) => ProductCard(product: e),
                              )
                              .toList(),
                        );
                      }
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
