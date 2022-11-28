import 'package:stacked/stacked.dart';
import 'package:shared_shopping_list/app/app.locator.dart';
import 'package:shared_shopping_list/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shared_shopping_list/models/recipe.dart';
import 'package:shared_shopping_list/repositories/recipes_repository.dart';

class RecipesListViewModel extends ReactiveViewModel {
  final _recipesRepository = locator<RecipesRepository>();
  final _navigationService = locator<NavigationService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_recipesRepository];

  List<Recipe> getAllRecipe() {
    return _recipesRepository.getAllRecipes();
  }

  void goToCreateNewRecipeScreen() {
    _navigationService.navigateToCreateNewRecipeView();
  }

  void goToEditRecipe(String id) {
    _navigationService.navigateToAddNewItemToRecipe(recipeId: id);
  }
}
