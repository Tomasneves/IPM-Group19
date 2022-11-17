import 'package:shared_shopping_list/app/app.locator.dart';
import 'package:shared_shopping_list/extensions/extensions.dart';
import 'package:shared_shopping_list/models/shopping_list.dart';
import 'package:shared_shopping_list/services/random_generator_service.dart';
import 'package:stacked/stacked.dart';

class ShoppingListsRepository with ReactiveServiceMixin {
  final _randomGeneratorService = locator<RandomGeneratorService>();
  late final _allShoppingLists = _randomGeneratorService.generateShoppingLists();

  List<ShoppingList> getAllShoppingLists() {
    return _allShoppingLists;
  }

  void addNewShoppingList(ShoppingList newShoppingList) {
    setState(() {
      _allShoppingLists.add(newShoppingList);
    });
  }
}
