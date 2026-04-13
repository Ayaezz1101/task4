import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:task4/model/productModel.dart';
import 'package:task4/services/supabase_service.dart';

class CoffeeProvider extends ChangeNotifier {
  final CoffeeService _service = CoffeeService();

  List<CoffeeModel> _products = [];
  bool _isLoading = false;
  String _searchQuery = "";
  String _selectedCategory = "All Coffee";
  double? _maxPrice;
  String _addressTitle = "Jl. Kpg Sutoyo";
  String _addressDetail = "Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.";
  String _deliveryNote = "";
  int _quantity = 1;
  LatLng _userLocation = const LatLng(33.5138, 36.2765);
  Map<String, int> _itemsQuantity = {};
  LatLng get userLocation => _userLocation;

  String get addressTitle => _addressTitle;
  String get addressDetail => _addressDetail;
  String get deliveryNote => _deliveryNote;
  int get quantity => _quantity;

  List<CoffeeModel> get products => _products;
  bool get isLoading => _isLoading;
  String get selectedCategory => _selectedCategory;
  int getProductQuantity(String productId) => _itemsQuantity[productId] ?? 1;

  Future<void> fetchAllProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await _service.fetchProducts1(
        query: _searchQuery,
        maxPrice: _maxPrice,
        category: _selectedCategory,
      );
    } catch (e) {
      debugPrint("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void updateSearch(String query) {
    _searchQuery = query;
    fetchAllProducts();
  }

  void updateCategory(String category) {
    _selectedCategory = category;
    fetchAllProducts();
  }

  void updateMaxPrice(double? price) {
    _maxPrice = price;
    fetchAllProducts();
  }

  void updateNote(String note) {
    _deliveryNote = note;
    notifyListeners();
  }

  void updateProductQuantity(String productId, int newQty) {
    if (newQty >= 0) {
      _itemsQuantity[productId] = newQty;
      notifyListeners();
    }
  }

  double getSubtotal(double price, String productId) {
  return price * getProductQuantity(productId);
}

  double getTotal(double price, String productId) {
  double subtotal = getSubtotal(price, productId);
  return subtotal + (subtotal > 0 ? 0.0 : 0.0); 
}

  void updateAddress(String title, String detail) async {
    _addressTitle = title;
    _addressDetail = detail;

    try {
      List<Location> locations = await locationFromAddress(detail);

      if (locations.isNotEmpty) {
        _userLocation = LatLng(
          locations.first.latitude,
          locations.first.longitude,
        );
      }
    } catch (e) {
      debugPrint("لم يتم العثور على إحداثيات لهذا العنوان: $e");
    }

    notifyListeners();
  }

double getTotalPrice() {
  double total = 0.0;
  for (var product in _products) {
    total += (product.price * getProductQuantity(product.id.toString()));
  }
  return total;
}
}
