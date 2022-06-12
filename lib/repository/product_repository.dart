import 'package:product_app/managers/api_manager.dart';
import 'package:product_app/managers/model/get_request.dart';
import 'package:product_app/models/product_model.dart';
import 'package:product_app/utils/json_reader.dart';

abstract class ProductRepository {
  ProductRepository({required this.apiManager});
  ApiManager apiManager;

  Future<List<Product>> getProducts();
}

class ProductRepositoryImpl extends ProductRepository {
  ProductRepositoryImpl({
    required ApiManager apiManager,
  }) : super(apiManager: apiManager);

  @override
  Future<List<Product>> getProducts() async {
    final dynamic res = await apiManager.callApiRequest(GetRequest('products'));
    final JsonReader reader = JsonReader(res);
    return reader.asListOfObjects().map((item) => Product.fromJson(item)).toList();
  }
}
