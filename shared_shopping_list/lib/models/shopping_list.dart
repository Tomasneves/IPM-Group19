// A 'model' is anything that represent some meaningful entity in our app.

import 'package:uuid/uuid.dart';

class Item {
  final String itemName;
  final String amount;
  final String owner;

  Item({
    required this.itemName,
    required this.amount,
    required this.owner,
  });
}

class ShoppingList {
  final String id;
  final String ownerName;
  final String shopName;
  final String listName;
  final DateTime timeOfPlannedShopping;
  final List<Item> items;
  final List<String> participantNames;
  final String currentShopper;

  ShoppingList({
    String? id,
    required this.ownerName,
    required this.listName,
    required this.shopName,
    required this.timeOfPlannedShopping,
    required this.items,
    required this.participantNames,
    required this.currentShopper,
  }) : id = id ?? const Uuid().v4();

  ShoppingList copyWith({
    String? id,
    String? ownerName,
    String? shopName,
    String? listName,
    DateTime? timeOfPlannedShopping,
    List<Item>? items,
    List<String>? participantNames,
    String? currentShopper,
  }) {
    return ShoppingList(
      id: id ?? this.id,
      ownerName: ownerName ?? this.ownerName,
      shopName: shopName ?? this.shopName,
      listName: listName ?? this.listName,
      timeOfPlannedShopping:
          timeOfPlannedShopping ?? this.timeOfPlannedShopping,
      items: items ?? this.items,
      participantNames: participantNames ?? this.participantNames,
      currentShopper: currentShopper ?? this.currentShopper,
    );
  }
}
