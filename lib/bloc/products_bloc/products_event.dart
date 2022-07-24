part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent {}

class ProductsSortEvent extends ProductsEvent {
  ProductsSortEvent({
    required this.isDesc,
    required this.category,
    required this.rating,
  });

  final String category;
  final String rating;
  final bool isDesc;
}

class ProductsFilterEvent extends ProductsEvent {
  ProductsFilterEvent({
    required this.category,
    required this.rating,
  });

  final String category;
  final String rating;
}
