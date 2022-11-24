// In repository we typically access persistnant data, but here we will use just a variable for storing data
// Thanks to the ReactiveServiceMixin we can use this class to hold a 'state' and notifies UI that this state changes and it should redraw the screen.
// More specifically, it notify the ShoppingListsViewModel who explicitly want to listen to this ShoppingListRepository. It notifies him, he notifies View, and redraw would happen and a updated value of 'state' will be shown to the screen.

import 'package:shared_shopping_list/app/app.locator.dart';
import 'package:shared_shopping_list/extensions/extensions.dart';
import 'package:shared_shopping_list/models/shopping_list.dart';
import 'package:shared_shopping_list/services/random_generator_service.dart';
import 'package:stacked/stacked.dart';

class ShoppingListsRepository with ReactiveServiceMixin {
  final _randomGeneratorService = locator<RandomGeneratorService>();
  late final _allShoppingLists =
      _randomGeneratorService.generateShoppingLists();

  List<ShoppingList> getAllShoppingLists() {
    return _allShoppingLists;
  }

  void deleteItemFromShoppingList(String id, int index) {
    setState(() {
      _allShoppingLists
          .singleWhere((element) => element.id == id)
          .items
          .removeAt(index);
    });
  }

  void removeParticipantFromShoppingList(String id, int index) {
    setState(() {
      _allShoppingLists
          .singleWhere((element) => element.id == id)
          .items
          .removeAt(index);
    });
  }

  void addItemToShoppingList(String id, Item item) {
    setState(() {
      _allShoppingLists
          .singleWhere((element) => element.id == id)
          .items
          .add(item);
    });
  }

  void addNewShoppingList(ShoppingList newShoppingList) {
    setState(() {
      _allShoppingLists.add(newShoppingList);
    });
  }

  ShoppingList getListById(String id) {
    return _allShoppingLists.singleWhere((element) => element.id == id);
  }
}
