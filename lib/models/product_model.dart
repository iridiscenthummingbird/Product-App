import 'package:product_app/models/rating_model.dart';
import 'package:product_app/utils/json_reader.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final JsonReader reader = JsonReader(json);

    return Product(
      id: reader['id'].asInt(),
      title: reader['title'].asString(),
      price: reader['price'].asDouble(),
      description: reader['description'].asString(),
      category: reader['category'].asString(),
      image: reader['image'].asString(),
      rating: Rating.fromJson(
        reader['rating'].asObject(),
      ),
    );
  }
}
