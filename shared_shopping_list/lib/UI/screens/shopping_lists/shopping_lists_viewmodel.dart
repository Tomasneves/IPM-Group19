import 'package:shared_shopping_list/app/app.locator.dart';
import 'package:shared_shopping_list/app/app.router.dart';
import 'package:shared_shopping_list/models/shopping_list.dart';
import 'package:shared_shopping_list/repositories/shopping_lists_repository.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ShoppingListsViewModel extends ReactiveViewModel {
  final _shoppingListsRepository = locator<ShoppingListsRepository>();
  final _navigationService = locator<NavigationService>();

  List<ShoppingList> get allShoppingLists => _shoppingListsRepository.getAllShoppingLists();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_shoppingListsRepository];

  void goToCreateNewShoppingListScreen() {
    _navigationService.navigateTo(Routes.createNewShoppingListView);
  }
}
