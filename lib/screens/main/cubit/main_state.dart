part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainProductsLoadedState extends MainState {
  MainProductsLoadedState({required this.products});

  final List<Product> products;
}

class MainLoadingState extends MainState {}
