class CoffeeModel {
  final int? id; 
  final String name;
  final String type;
  final double price;
  final double rating;
  final String imageUrl;
  final String description;

  CoffeeModel({
    this.id,
    required this.name,
    required this.type,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.description,
  });

  factory CoffeeModel.fromJson(Map<String, dynamic> json) {
    return CoffeeModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      imageUrl: json['image_url'],
      description: json['description'],
    );
  }
}