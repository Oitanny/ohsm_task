
import 'package:hotelvista/models/item.dart';

List<FoodItem> filterFoodItems(String searchText) {
    if (searchText.isEmpty) {
      return [];
    }
    return foodItems.where((item) => item.name.toLowerCase().contains(searchText.toLowerCase())).toList();
}
