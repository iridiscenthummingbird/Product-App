import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product_app/extensions/error_handler.dart';
import 'package:product_app/models/product_model.dart';
import 'package:product_app/repository/product_repository.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit({
    required this.productRepository,
  }) : super(MainLoadingState());
  final ProductRepository productRepository;

  Future<void> loadProducts() async {
    emit(
      MainProductsLoadedState(
        products: await productRepository.getProducts().withErrorHandler(this) as List<Product>,
      ),
    );
  }
}
