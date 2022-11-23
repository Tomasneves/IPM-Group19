import 'package:shared_shopping_list/models/shopping_list.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_shopping_list/app/app.locator.dart';
import 'package:shared_shopping_list/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shared_shopping_list/repositories/shopping_lists_repository.dart';

class ShoppingListViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _shoppingListsRepository = locator<ShoppingListsRepository>();

   @override
  List<ReactiveServiceMixin> get reactiveServices => [_shoppingListsRepository];

  void goToAddNewItemScreen(String id) {
    _navigationService.navigateToAddNewItemView(listId: id);
  }

  void goToAddNewItemFromRecipeScreen(String id) {
    _navigationService.navigateToAddNewItemFromRecipeView(listId: id);
  }

  void deleteItem(String listId, int index) {
    _shoppingListsRepository.deleteItemFromShoppingList(listId, index);
  }

  ShoppingList getListById(String id){
    return _shoppingListsRepository.getListById(id);
  }

}
