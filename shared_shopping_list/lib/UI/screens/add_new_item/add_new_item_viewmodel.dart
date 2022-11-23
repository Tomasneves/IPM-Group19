import 'package:stacked/stacked.dart';
import 'package:shared_shopping_list/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shared_shopping_list/models/shopping_list.dart';
import 'package:shared_shopping_list/UI/screens/shopping_list/shopping_list_viewmodel.dart';

class AddNewItemViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void addItem(ShoppingListViewModel model, ShoppingList list, Item item) {
    //FocusManager.instance.primaryFocus?.unfocus();

    model.addItem(list, item);

    _navigationService.back();
  }
}
