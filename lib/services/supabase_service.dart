import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task4/model/productModel.dart';

class CoffeeService {
  final supabase = Supabase.instance.client;

  Future<List<CoffeeModel>> fetchProducts1({
    String? query,
    double? maxPrice,
    String? category,
  }) async {
    try {
      var request = supabase.from('products').select();

      if (query != null && query.isNotEmpty) {
        request = request.ilike('name', '%$query%');
      }

      if (maxPrice != null) {
        request = request.lte('price', maxPrice);
      }

      if (category != null && category != "All Coffee") {
        request = request.ilike('name', '%$category%');
      }

      final response = await request;
      final List data = response as List;
      return data.map((item) => CoffeeModel.fromJson(item)).toList();
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }
}
