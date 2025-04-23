class MainCategory {
  final int id;
  final String name;
  final List<SubCategory> subCategory;

  MainCategory(
      {required this.id, required this.name, required this.subCategory});

  factory MainCategory.fromJson(Map<String, dynamic> json) {
    return MainCategory(
      id: json['id'],
      name: json['name'],
      subCategory: (json['subCategory'] as List)
          .whereType<Map<String, dynamic>>()
          .map((e) => SubCategory.fromJson(e))
          .toList(),
    );
  }

  int get totalQuantity =>
      subCategory.fold(0, (sum, sub) => sum + sub.totalQuantity);
}

class SubCategory {
  final int id;
  final String name;
  final String image;
  final List<Product> products;

  SubCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.products,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      products: (json['products'] as List)
          .whereType<Map<String, dynamic>>()
          .map((e) => Product.fromJson(e))
          .toList(),
    );
  }

  int get totalQuantity => products.fold(0, (sum, p) => sum + p.quantity);
}

class Product {
  final int id;
  final String name;
  final String image;
  final double price;
  final int quantity;
  final double discountPercentage;
  final bool status;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.discountPercentage,
    required this.status,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      status: json['status'],
    );
  }
}
