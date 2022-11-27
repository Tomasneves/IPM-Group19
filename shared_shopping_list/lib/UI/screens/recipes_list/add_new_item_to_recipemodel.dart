import 'package:stacked/stacked.dart';
import 'package:shared_shopping_list/app/app.locator.dart';
import 'package:shared_shopping_list/models/recipe.dart';
import 'package:shared_shopping_list/repositories/recipes_repository.dart';

class AddNewItemToRecipeModel extends BaseViewModel {
  final _recipesRepository = locator<RecipesRepository>();

  Recipe getRecipe(String id) {
    return _recipesRepository.getRecipeById(id);
  }

  List<RecipeItem> getAllRecipeItems(String id) {
    return _recipesRepository.getRecipeById(id).items;
  }
}

class AddNewItemToRecipeModel2 extends BaseViewModel {
  final _recipesRepository = locator<RecipesRepository>();

  Recipe getRecipe(String id) {
    return _recipesRepository.getRecipeById(id);
  }

  List<RecipeItem> getAllRecipeItems(String id) {
    return _recipesRepository.getRecipeById(id).items;
  }
}
