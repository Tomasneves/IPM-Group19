// A 'model' is anything that represent some meaningful entity in our app.

import 'package:flutter/material.dart';
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
  final String id = const Uuid().v4();
  final String ownerName;
  final String shopName;
  final String listName;
  final DateTime timeOfPlannedShopping;
  final List<Item> items;
  final List<String> participantNames;
  final String currentShopper;

  ShoppingList({
    required this.ownerName,
    required this.listName,
    required this.shopName,
    required this.timeOfPlannedShopping,
    required this.items,
    required this.participantNames,
    required this.currentShopper,
  });
}
