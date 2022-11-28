// 'service' can be any functionality group together in one class

import 'dart:math';
import 'package:shared_shopping_list/models/shopping_list.dart';
import 'package:shared_shopping_list/models/recipe.dart';

class RandomGeneratorService {
  final allShopNames = [
    'Lidl',
    'Auchan',
    'Pingo doce',
    'Amanhecer',
    'Mini market',
  ];

  final allPeopleNames = [
    'Marc',
    'Michal',
    'Brigita',
    'Eloh',
    'Adam',
    'Peter',
    'Shivang',
    'Maxim',
    'Sofia',
  ];

  final allShopItems = {
    'Milk': '1L',
    'Tomato sauce': '200ml',
    'Pasta': '300g',
    'Tomatoes': '2',
    'Water': '0.5L',
    'Bread': '1',
    'Eggs': '6',
    'Butter': '1',
    'Ham': '15g',
    'Toilet paper': '10',
    'Salad': '1',
  };

  final allRecipesNames = [
    'Brownies',
    'Best food',
    'Cari Chicken',
    'Spaghetti Carbonara',
    "Mom's spaghetti",
    'Cookies',
    'Apple pie',
    'Banana smoothie'
  ];

  final allRecipeItems = {
    'Banana': '5',
    'Milk': '1l',
    'Ketchup': '500ml',
    'Tomato': '4',
    'Chicken': '1kg',
    'Curry': '20g',
    'Flour': '150g',
    'Sugar': '100g',
  };

  List<ShoppingList> generateShoppingLists(){
    List<ShoppingList> list = [];
    list.add(ShoppingList(
      ownerName: "Mota", 
      listName: "Mota's", 
      shopName: "Continente", 
      timeOfPlannedShopping: generateDateTimeInFuture(), 
      items: [Item(itemName: "Milk", amount: "1l", owner: "Mota")], 
      participantNames: ["Mota", "Peter", "Henry"], 
      currentShopper: "Mota"));
    list.addAll(List.generate(2, (index) => generateShoppingList()));
    return list;
  }
  

  List<Recipe> generateRecipes() {
    List<Recipe> list = [];
    List<RecipeItem> items = [];
    items.add(RecipeItem(itemName: "Tomato Sauce", itemAmount: "200ml"));
    items.add(RecipeItem(itemName: "Lasagna noodles", itemAmount: "500g"));
    list.add(Recipe(recipeName: "Lasagna", items: items));
    list.addAll(List.generate(9, (index) => generateRecipe()));
    return list;
  } 

  ShoppingList generateShoppingList() {
    final owner = generatePersonName();
    return ShoppingList(
      ownerName: owner,
      listName: "$owner's list",
      shopName: generateShopName(),
      timeOfPlannedShopping: generateDateTimeInFuture(),
      items: generateShopItems(),
      participantNames: generatePersonsNames(),
      currentShopper: owner,
    );
  }

  DateTime generateDateTimeInFuture() {
    return DateTime.now().add(Duration(minutes: Random().nextInt(60 * 24 * 14)));
  }

  String generateShopName() {
    return allShopNames[Random().nextInt(allShopNames.length - 1)];
  }

  String generatePersonName() {
    return allPeopleNames[Random().nextInt(allPeopleNames.length - 1)];
  }

  List<String> generatePersonsNames({int minCount = 1}) {
    final namesCopied = [...allPeopleNames];
    namesCopied.shuffle();
    return namesCopied
        .take(minCount + Random().nextInt(allPeopleNames.length - 1 - minCount))
        .toList();
  }

  List<Item> generateShopItems({int minCount = 2}) {
    var list = allShopItems.entries
        .map((e) => Item(itemName: e.key, amount: e.value, owner: generatePersonName()))
        .toList();
    list.shuffle();
    return list.take(minCount + Random().nextInt(allShopItems.length - 1 - minCount)).toList();
  }

  Recipe generateRecipe() {
    return Recipe(
      recipeName: generateRecipeName(),
      items: generateRecipeItems(),
    );
  }

  String generateRecipeName() {
    return allRecipesNames[Random().nextInt(allRecipesNames.length - 1)];
  }

  List<RecipeItem> generateRecipeItems({int minCount = 2}) {
    var list = allRecipeItems.entries
        .map((e) => RecipeItem(itemName: e.key, itemAmount: e.value))
        .toList();
    list.shuffle();
    return list.take(minCount + Random().nextInt(allRecipeItems.length - 1 - minCount)).toList();
  }
}
