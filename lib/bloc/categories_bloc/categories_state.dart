part of 'categories_bloc.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesData extends CategoriesState {
  CategoriesData({required this.categories});
  final List<String> categories;
}

class CategoriesError extends CategoriesState {
  CategoriesError({required this.error});
  final String error;
}
