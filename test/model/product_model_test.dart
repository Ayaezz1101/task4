import 'package:flutter_test/flutter_test.dart';
import 'package:task4/model/product_model.dart'; 

void main() {
  group('CoffeeModel Unit Tests', () {
    
    test('يجب تحويل البيانات من JSON إلى CoffeeModel بنجاح وبأنواع صحيحة', () {
      final Map<String, dynamic> mockJson = {
        'id': 1,
        'name': 'Caffè Latte',
        'type': 'Espresso Based',
        'price': 4.5, 
        'rating': 4.8,
        'image_url': 'assets/images/latte.png',
        'description': 'A smooth and creamy espresso drink.'
      };

      final coffee = CoffeeModel.fromJson(mockJson);

      expect(coffee.id, 1);
      expect(coffee.name, 'Caffè Latte');
      expect(coffee.price, 4.5);
      expect(coffee.rating, 4.8);
    });

    test('يجب أن ينجح التحويل حتى لو كان السعر والتقييم أرقاماً صحيحة int في الـ JSON', () {
      final Map<String, dynamic> mockJsonInts = {
        'id': 2,
        'name': 'Black Coffee',
        'type': 'Filter',
        'price': 3,
        'rating': 4,
        'image_url': 'assets/images/black.png',
        'description': 'Pure black coffee.'
      };

      final coffee = CoffeeModel.fromJson(mockJsonInts);

      expect(coffee.price, 3.0);
      expect(coffee.rating, 4.0);
    });
  });
}