import 'package:shared_shopping_list/app/app.locator.dart';
import 'package:shared_shopping_list/extensions/extensions.dart';
import 'package:shared_shopping_list/models/shopping_list.dart';
import 'package:shared_shopping_list/repositories/shopping_lists_repository.dart';
import 'package:shared_shopping_list/services/random_generator_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateShoppingListViewModel extends BaseViewModel {
  final _shoppingListsRepository = locator<ShoppingListsRepository>();
  final _randomGeneratorService = locator<RandomGeneratorService>();
  final _navigationService = locator<NavigationService>();

  late ShoppingList _currentEditingShoppingList;

  ShoppingList get currentEditingShoppingList => _currentEditingShoppingList;

  List<String> participants = <String>[];

  CreateShoppingListViewModel(String? existingShoppingListId) {
    if (existingShoppingListId == null) {
      _currentEditingShoppingList = ShoppingList(
        ownerName: '',
        items: [],
        timeOfPlannedShopping: DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          DateTime.now().hour + 1,
          0,
        ),
        shopName: '',
        currentShopper: '',
        listName: '',
        participantNames: [],
      );
    } else {
      _currentEditingShoppingList =
          _shoppingListsRepository.getListById(existingShoppingListId);
    }
  }

  void removeParticipant(String listId, int index) {
    _shoppingListsRepository.removeParticipantFromShoppingList(listId, index);
  }

  void addNewRandomShoppingListAndGoBack() {
    final newShoppingList = _randomGeneratorService.generateShoppingList();
    _shoppingListsRepository.addNewShoppingList(newShoppingList);

    _navigationService.back();
  }

  void createShoppingListAndGoBack() {
    _shoppingListsRepository.addNewShoppingList(currentEditingShoppingList);
    _navigationService.back();
  }

  void saveChangesToShoppingListAndGoBack() {
    _shoppingListsRepository
        .updateExistingShoppingList(currentEditingShoppingList);
    _navigationService.back();
  }

  void updateTimeOfShoppingList(DateTime newDateTime) {
    setState(() {
      _currentEditingShoppingList = _currentEditingShoppingList.copyWith(
          timeOfPlannedShopping: newDateTime);
    });
  }

  void updateListNameOfShoppingList(String value) {
    setState(() {
      _currentEditingShoppingList = _currentEditingShoppingList.copyWith(
        ownerName: value,
        currentShopper: value,
        listName: value,
      );
    });
  }

  void updateShopNameOfShoppingList(String value) {
    setState(() {
      _currentEditingShoppingList =
          _currentEditingShoppingList.copyWith(shopName: value);
    });
  }

  ShoppingList getListById(String id) {
    return _shoppingListsRepository.getListById(id);
  }

  void removeItem(String listId, int index) {
    _shoppingListsRepository.removeParticipantFromShoppingList(listId, index);
  }
}
