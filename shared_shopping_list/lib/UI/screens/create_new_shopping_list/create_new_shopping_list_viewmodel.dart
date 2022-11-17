import 'package:shared_shopping_list/app/app.locator.dart';
import 'package:shared_shopping_list/repositories/shopping_lists_repository.dart';
import 'package:shared_shopping_list/services/random_generator_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateNewShoppingListViewModel extends BaseViewModel {
  final _shoppingListsRepository = locator<ShoppingListsRepository>();
  final _randomGeneratorService = locator<RandomGeneratorService>();
  final _navigationService = locator<NavigationService>();

  void addNewRandomShoppingListAndGoBack() {
    final newShoppingList = _randomGeneratorService.generateShoppingList();
    _shoppingListsRepository.addNewShoppingList(newShoppingList);

    _navigationService.back();
  }
}
