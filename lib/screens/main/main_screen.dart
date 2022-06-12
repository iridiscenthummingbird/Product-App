import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:product_app/models/product_model.dart';
import 'package:product_app/repository/product_repository.dart';
import 'package:product_app/screens/main/cubit/main_cubit.dart';
import 'package:product_app/screens/main/widgets/product_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String routeName = '/main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final MainCubit _cubit;

  @override
  void initState() {
    _cubit = MainCubit(productRepository: context.read<ProductRepository>());
    _cubit.loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          title: const Text(
            'Products',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: BlocBuilder(
        bloc: _cubit,
        builder: (context, state) {
          if (state is MainProductsLoadedState) {
            final List<Product> products = state.products;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: MasonryGridView.count(
                  itemCount: products.length,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  itemBuilder: (context, index) {
                    final Product product = products[index];
                    return ProductCard(product: product);
                  }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
