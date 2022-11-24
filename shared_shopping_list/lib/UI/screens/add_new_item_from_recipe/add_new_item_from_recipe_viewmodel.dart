import 'package:stacked/stacked.dart';
import 'package:shared_shopping_list/app/app.locator.dart';
import 'package:shared_shopping_list/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shared_shopping_list/models/shopping_list.dart';
import 'package:shared_shopping_list/models/recipe.dart';
import 'package:shared_shopping_list/repositories/shopping_lists_repository.dart';
import 'package:shared_shopping_list/repositories/recipes_repository.dart';

class AddNewItemFromRecipeViewModel extends ReactiveViewModel {
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
}
