import 'package:stacked/stacked.dart';
import 'package:shared_shopping_list/app/app.locator.dart';
import 'package:shared_shopping_list/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shared_shopping_list/models/recipe.dart';
import 'package:shared_shopping_list/repositories/recipes_repository.dart';

class RecipesListViewModel extends BaseViewModel {
  final _recipesRepository = locator<RecipesRepository>();

  List<Recipe> getAllRecipe() {
    return _recipesRepository.getAllRecipes();
  }
}
