import 'package:stacked/stacked.dart';
import 'package:shared_shopping_list/app/app.locator.dart';
import 'package:shared_shopping_list/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class ShoppingListViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void goToAddNewItemScreen() {
    _navigationService.navigateTo(Routes.addNewItemView);
  }

  void goToAddNewItemFromRecipeScreen() {
    _navigationService.navigateTo(Routes.addNewItemFromRecipeView);
  }

}
