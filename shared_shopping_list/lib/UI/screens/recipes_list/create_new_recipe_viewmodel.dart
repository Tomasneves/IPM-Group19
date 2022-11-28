import 'package:stacked/stacked.dart';
import 'package:shared_shopping_list/app/app.locator.dart';
import 'package:shared_shopping_list/app/app.router.dart';
import 'package:shared_shopping_list/repositories/recipes_repository.dart';
import 'package:shared_shopping_list/models/recipe.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateNewRecipeViewModel extends BaseViewModel {
  final _recipesRepository = locator<RecipesRepository>();
  final _navigationService = locator<NavigationService>();

  String createRecipe(String name) {
    Recipe newRecipe = Recipe(recipeName: name, items: []);
    _recipesRepository.createNewRecipe(newRecipe);
    return newRecipe.id;
  }

  void goToAddNewItemToRecipeScreen(String id) {
    _navigationService.navigateToAddNewItemToRecipe(recipeId: id);
  }
}
