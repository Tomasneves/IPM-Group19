import 'package:stacked/stacked.dart';
import 'package:shared_shopping_list/app/app.locator.dart';
import 'package:shared_shopping_list/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shared_shopping_list/models/shopping_list.dart';
import 'package:shared_shopping_list/models/recipe.dart';
import 'package:shared_shopping_list/repositories/shopping_lists_repository.dart';
import 'package:shared_shopping_list/repositories/recipes_repository.dart';

class ChooseItemFromRecipeViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _shoppingListsRepository = locator<ShoppingListsRepository>();
  final _recipesRepository = locator<RecipesRepository>();
  
  
  List<Recipe> get allRecipes => _recipesRepository.getAllRecipes();
  

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_recipesRepository];

  ShoppingList getListById(String id) {
    return _shoppingListsRepository.getListById(id);
  }

  List<Recipe> getAllRecipes() {
    return _recipesRepository.getAllRecipes();
  }

  Recipe getRecipeById(String id) {
    return _recipesRepository.getRecipeById(id);
  }

  List<bool> getSelectedRows(){
    return _recipesRepository.getSelectedRows();
  }

  void changeSelecedRows(int index){
    _recipesRepository.changeSelectedRows(index);
  }

  void addSelectedItemsAndGoBack(String listId, String recipeId){
    List<Item> items = [];
    for (var i = 0; i < _recipesRepository.getSelectedRows().length; i++){
      if (_recipesRepository.getSelectedRows()[i]){
        final temp = _recipesRepository.getRecipeById(recipeId).items[i];
        items.add(Item(itemName: temp.itemName, amount: temp.itemAmount, owner: "You"));
      }
    }
    
    _shoppingListsRepository.addItemsToShoppingList(listId, items);

    _navigationService.back();
    _navigationService.back();
  }
}
