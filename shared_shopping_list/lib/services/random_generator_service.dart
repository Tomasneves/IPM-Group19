import 'dart:math';
import 'package:shared_shopping_list/models/shopping_list.dart';

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

  final allShopItems = [
    'Milk 1L',
    'Tomato sauce 200ml',
    'Pasta 300g',
    'Tomatoes 2x',
    'Water 0.5L',
    'Bread 1x',
    'Eggs 6x',
    'Butter 1x',
    'Ham 15g',
    'Toilet paper 10x',
    'Salad 1x',
  ];

  List<ShoppingList> generateShoppingLists() => List.generate(3, (index) => generateShoppingList());

  ShoppingList generateShoppingList() {
    return ShoppingList(
      ownerName: generatePersonName(),
      shopName: generateShopName(),
      timeOfPlannedShopping: generateDateTimeInFuture(),
      items: generateShopItems(),
      participantNames: generatePersonsNames(),
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

  List<String> generateShopItems({int minCount = 3}) {
    final itemsCopied = [...allShopItems];
    itemsCopied.shuffle();
    return itemsCopied
        .take(minCount + Random().nextInt(allShopItems.length - 1 - minCount))
        .toList();
  }
}
