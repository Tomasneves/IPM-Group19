import 'package:stacked/stacked.dart';
import 'package:shared_shopping_list/app/app.locator.dart';
import 'package:shared_shopping_list/repositories/recipes_repository.dart';
import 'package:shared_shopping_list/models/recipe.dart';

class CreateNewRecipeViewModel extends BaseViewModel {
  final _recipesRepository = locator<RecipesRepository>();

  String createRecipe(String name) {
    Recipe newRecipe = Recipe(recipeName: name, items: []);
    String newRecipeId = newRecipe.id;
    _recipesRepository.createNewRecipe(newRecipe);
    return newRecipeId;
  }
}
