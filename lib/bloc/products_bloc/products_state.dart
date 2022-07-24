part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsData extends ProductsState {
  ProductsData({required this.data});
  final List<ProductModel> data;
}

class ProductsError extends ProductsState {
  ProductsError({required this.error});
  final String error;
}
