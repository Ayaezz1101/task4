import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task4/provider/coffee_providor.dart'; 
import 'package:task4/model/product_model.dart'; 

class FakeSupabaseClient extends Fake implements SupabaseClient {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('CoffeeProvider Unit Tests', () {
    late CoffeeProvider coffeeProvider;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      
      await Supabase.initialize(
        url: 'https://fake-url.supabase.co',
        anonKey: 'fake-anon-key',
      );

      coffeeProvider = CoffeeProvider();
    });


    test('الكمية الابتدائية لأي منتج داخل السلة يجب أن تكون صفر', () {
      expect(coffeeProvider.getProductQuantity('1'), 0);
    });

    test('عند استدعاء addToCart، يجب أن تزداد كمية المنتج المحدد في السلة بمقدار 1', () {
      coffeeProvider.addToCart('1');
      expect(coffeeProvider.getProductQuantity('1'), 1);

      coffeeProvider.addToCart('1');
      expect(coffeeProvider.getProductQuantity('1'), 2);
    });

    test('عند استدعاء removeFromCart، يجب أن تقل الكمية أو يحذف المنتج تماماً إذا كانت كميته 1', () {
      
      coffeeProvider.addToCart('1');
      coffeeProvider.addToCart('1');
      
      coffeeProvider.removeFromCart('1');
      expect(coffeeProvider.getProductQuantity('1'), 1);

      coffeeProvider.removeFromCart('1');
      expect(coffeeProvider.getProductQuantity('1'), 0);
    });

    test('دالة getTotalPrice يجب أن تحسب المجموع الكلي للمنتجات المضافة في السلة بدقة بناءً على كمياتها', () {
      
      final coffee1 = CoffeeModel(
        id: 1, 
        name: 'Latte', 
        type: 'Espresso', 
        price: 4.0, 
        rating: 4.5, 
        imageUrl: '', 
        description: ''
      );
      final coffee2 = CoffeeModel(
        id: 2, 
        name: 'Mocha', 
        type: 'Espresso', 
        price: 5.5, 
        rating: 4.7, 
        imageUrl: '', 
        description: ''
      );

      coffeeProvider.products.addAll([coffee1, coffee2]);

      coffeeProvider.addToCart('1'); 
      coffeeProvider.addToCart('2'); 
      coffeeProvider.addToCart('2'); 

      expect(coffeeProvider.getTotalPrice(), 15.0);
    });

    test('دالة placeOrder يجب ألا تضيف طلباً جديداً إلى السجل إذا كانت السلة فارغة', () async {
      
      await coffeeProvider.placeOrder();

      expect(coffeeProvider.orderHistory.isEmpty, true);
    });
  });
}