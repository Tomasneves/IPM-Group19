// 'service' can be any functionality group together in one class

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

  final allShopItems = {
    'Milk' : '1L',
    'Tomato sauce' : '200ml',
    'Pasta' : '300g',
    'Tomatoes' : '2',
    'Water' : '0.5L',
    'Bread' : '1',
    'Eggs' : '6',
    'Butter' : '1',
    'Ham' : '15g',
    'Toilet paper' : '10',
    'Salad' : '1',
  };

  List<ShoppingList> generateShoppingLists() => List.generate(3, (index) => generateShoppingList());

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
    var list = allShopItems.entries.map((e) => Item(itemName: e.key, amount: e.value, owner: generatePersonName())).toList();
    list.shuffle();
    return list.take(minCount + Random().nextInt(allShopItems.length - 1 - minCount)).toList();
  }
}
