import 'package:uuid/uuid.dart';

class RecipeItem {
  final String itemName;
  final String itemAmount;

  RecipeItem({
    required this.itemName,
    required this.itemAmount,
  });
}


class Recipe {
  final String id = const Uuid().v4();
  final String recipeName;
  final List<RecipeItem> items;

  Recipe({
    required this.recipeName,
    required this.items,
  });
}