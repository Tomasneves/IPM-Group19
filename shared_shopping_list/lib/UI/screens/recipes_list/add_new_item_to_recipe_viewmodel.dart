import 'package:stacked/stacked.dart';
import 'package:shared_shopping_list/app/app.locator.dart';
import 'package:shared_shopping_list/app/app.router.dart';
import 'package:shared_shopping_list/models/recipe.dart';
import 'package:shared_shopping_list/repositories/recipes_repository.dart';
import 'package:stacked_services/stacked_services.dart';


class AddNewItemToRecipeModel extends ReactiveViewModel {
  final _recipesRepository = locator<RecipesRepository>();
  final _navigationService = locator<NavigationService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_recipesRepository];

  Recipe getRecipe(String id) {
    return _recipesRepository.getRecipeById(id);
  }

  List<RecipeItem> getAllRecipeItems(String id) {
    return _recipesRepository.getRecipeById(id).items;
  }

  void addItemAndGoBack(String id, String name, String amount) {
    RecipeItem tmp = RecipeItem(itemName: name, itemAmount: amount);
    _recipesRepository.addItemToRecipe(id, tmp);
    _navigationService.back();
  }
}
