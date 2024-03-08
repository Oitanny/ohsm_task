class FoodItem {
  final String name;
  final double price;

  FoodItem({required this.name, required this.price});

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      name: json['name'],
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
    };
  }
}

var foodItems = [
  FoodItem(name: 'Pizza', price: 10.00),
  FoodItem(name: 'Burger', price: 8.00),
  FoodItem(name: 'Pasta', price: 12.00),
  // Add more food items as needed
];
