import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/managers/api_manager.dart';
import 'package:product_app/repository/product_repository.dart';

class DI extends StatelessWidget {
  final Widget child;

  const DI({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ApiManager>(
          create: (context) => ApiManagerImpl(),
        ),
        RepositoryProvider<ProductRepository>(
          create: (context) => ProductRepositoryImpl(
            apiManager: context.read<ApiManager>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
