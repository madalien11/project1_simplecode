import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1_simplecode/bloc/auth_bloc/auth_bloc.dart';
import 'package:project1_simplecode/bloc/categories_bloc/categories_bloc.dart';
import 'package:project1_simplecode/repo/repo_auth.dart';
import 'package:project1_simplecode/repo/repo_products.dart';

import '../bloc/products_bloc/products_bloc.dart';
import '../repo/api.dart';
import '../repo/repo_settings.dart';

class InitWidget extends StatelessWidget {
  const InitWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => RepoSettings(),
        ),
        RepositoryProvider(
          create: (context) => Api(),
        ),
        RepositoryProvider(
          create: (context) => RepoProducts(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        RepositoryProvider(
          create: (context) => RepoAuth(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: ((context) => ProductsBloc(
                  repo: RepositoryProvider.of(context),
                )..add(
                    ProductsSortEvent(
                      isDesc: false,
                      category: 'all',
                      rating: 'all',
                    ),
                  )),
          ),
          BlocProvider(
            create: ((context) => CategoriesBloc(
                  repo: RepositoryProvider.of(context),
                )..add(GetCategoriesEvent())),
          ),
          BlocProvider(
            create: ((context) => AuthBloc(
                  repo: RepositoryProvider.of(context),
                )),
          ),
        ],
        child: child,
      ),
    );
  }
}
