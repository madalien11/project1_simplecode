import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repo/repo_products.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc({required this.repo}) : super(CategoriesInitial()) {
    on<GetCategoriesEvent>((event, emit) async {
      final result = await repo.getCategories();
      if (result.errorMessage != null) {
        emit(CategoriesError(error: result.errorMessage!));
        return;
      }
      emit(CategoriesData(categories: result.categoriesList!));
    });
  }

  final RepoProducts repo;
}
