import 'package:stacked/stacked.dart';
import 'package:shared_shopping_list/app/app.locator.dart';
import 'package:shared_shopping_list/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shared_shopping_list/models/shopping_list.dart';
import 'package:shared_shopping_list/repositories/shopping_lists_repository.dart';

class AddNewItemFromRecipeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _shoppingListsRepository = locator<ShoppingListsRepository>();

  ShoppingList getListById(String id) {
    return _shoppingListsRepository.getListById(id);
  }
}
