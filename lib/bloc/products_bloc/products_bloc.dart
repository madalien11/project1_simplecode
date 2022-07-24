import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1_simplecode/model/product_model.dart';
import 'package:project1_simplecode/repo/repo_products.dart';

import '../../constants/utils.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({required this.repo}) : super(ProductsInitial()) {
    on<ProductsSortEvent>((event, emit) async {
      emit(ProductsLoading());
      final result = await repo.sortProducts(event.isDesc);
      if (result.errorMessage != null) {
        emit(ProductsError(error: result.errorMessage!));
        return;
      }
      data = result.productsList!;
      emit(
        ProductsData(
          data: filter(
            data: data,
            rating: event.rating,
            category: event.category,
          ),
        ),
      );
    });

    on<ProductsFilterEvent>((event, emit) {
      emit(
        ProductsData(
          data: filter(
            data: data,
            rating: event.rating,
            category: event.category,
          ),
        ),
      );
    });
  }

  final RepoProducts repo;
  late List<ProductModel> data;
}
