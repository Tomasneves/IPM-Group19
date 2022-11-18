// A 'model' is anything that represent some meaningful entity in our app. 

class ShoppingList {
  final String shopName;
  final String ownerName;
  final DateTime timeOfPlannedShopping;
  final List<String> items;
  final List<String> participantNames;

  ShoppingList({
    required this.ownerName,
    required this.shopName,
    required this.timeOfPlannedShopping,
    required this.items,
    required this.participantNames,
  });
}
