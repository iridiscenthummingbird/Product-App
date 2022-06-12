import 'package:product_app/utils/json_reader.dart';

class Rating {
  final double rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    final JsonReader reader = JsonReader(json);
    return Rating(
      rate: reader['rate'].asDouble(),
      count: reader['count'].asInt(),
    );
  }
}
