// In repository we typically access persistnant data, but here we will use just a variable for storing data
// Thanks to the ReactiveServiceMixin we can use this class to hold a 'state' and notifies UI that this state changes and it should redraw the screen.
// More specifically, it notify the ShoppingListsViewModel who explicitly want to listen to this ShoppingListRepository. It notifies him, he notifies View, and redraw would happen and a updated value of 'state' will be shown to the screen.

import 'package:shared_shopping_list/app/app.locator.dart';
import 'package:shared_shopping_list/extensions/extensions.dart';
import 'package:shared_shopping_list/models/recipe.dart';
import 'package:shared_shopping_list/services/random_generator_service.dart';
import 'package:stacked/stacked.dart';

class RecipesRepository with ReactiveServiceMixin {
  final _randomGeneratorService = locator<RandomGeneratorService>();
  late final _allRecipes =
      _randomGeneratorService.generateRecipes();
  
  late final List<bool> selectedRows = []; 

  List<bool> getSelectedRows(){
    return selectedRows;
  }

  void changeSelecedRows(int index){
    setState(() {
      selectedRows[index] = !selectedRows[index];
    });
  }

  void setSelectedRows(String recipeId){
    selectedRows.addAll(List.filled(getRecipeById(recipeId).items.length, true));
  }

  void unsetSelectedRows(){
    selectedRows.clear();
  }

  List<Recipe> getAllRecipes() {
    return _allRecipes;
  }

  void createNewRecipe(Recipe newRecipe) {
    setState(() {
      _allRecipes.add(newRecipe);
    });
  }

  void deleteItemFromRecipe(String id, int index){
    setState(() {
      _allRecipes
          .singleWhere((element) => element.id == id)
          .items
          .removeAt(index);
    });
  }

  Recipe getRecipeById(String id) {
    return _allRecipes.singleWhere((element) => element.id == id);
  }
}
