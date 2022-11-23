import 'package:shared_shopping_list/models/shopping_list.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_shopping_list/app/app.locator.dart';
import 'package:shared_shopping_list/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shared_shopping_list/extensions/extensions.dart';

class ShoppingListViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void goToAddNewItemScreen(ShoppingList list, ShoppingListViewModel view) {
    _navigationService.navigateToAddNewItemView(currentList: list, shoppingListViewModel: view);
  }

  void goToAddNewItemFromRecipeScreen(ShoppingList list, ShoppingListViewModel view) {
    _navigationService.navigateToAddNewItemFromRecipeView(currentList: list, shoppingListViewModel: view);
  }

  void deleteRow(ShoppingList list, int index) {
    setState(() => list.items.removeAt(index));
  }

  void addItem(ShoppingList list, Item item) {
    setState(() => list.items.add(item));
  }

}
