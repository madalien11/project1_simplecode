import 'package:project1_simplecode/model/product_model.dart';

import '../generated/l10n.dart';
import 'api.dart';

class RepoProducts {
  RepoProducts({required this.api});
  final Api api;

  Future<ResultRepoProducts> sortProducts(bool isDesc) async {
    try {
      final result = await api.dio.get(
        'https://fakestoreapi.com/products/',
        queryParameters: {"sort": isDesc ? 'desc' : 'asc'},
      );

      final List productsListJson = result.data ?? [];
      final productsList =
          productsListJson.map((e) => ProductModel.fromJson(e)).toList();
      return ResultRepoProducts(productsList: productsList);
    } catch (e) {
      return ResultRepoProducts(
        errorMessage: S.current.somethingWentWrong,
      );
    }
  }

  Future<ResultRepoProducts> getCategories() async {
    try {
      final result = await api.dio.get(
        'https://fakestoreapi.com/products/categories',
      );

      final List categoriesListJson = result.data ?? [];
      final List<String> categoriesList =
          categoriesListJson.map((e) => e.toString()).toList();
      return ResultRepoProducts(categoriesList: categoriesList);
    } catch (e) {
      return ResultRepoProducts(
        errorMessage: S.current.somethingWentWrong,
      );
    }
  }
}

class ResultRepoProducts {
  ResultRepoProducts({
    this.productsList,
    this.errorMessage,
    this.categoriesList,
  });

  final String? errorMessage;
  final List<ProductModel>? productsList;
  final List<String>? categoriesList;
}
