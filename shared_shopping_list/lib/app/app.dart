// Here you can define the Routes. You can think of a Route as a Screen, but there can be some differences.
// Here you can also register all the services, which then can be accessed as a Singleton thorough the whole app through Locator

import 'package:shared_shopping_list/UI/screens/create_or_update_shopping_list/create_or_update_shopping_list_view.dart';
import 'package:shared_shopping_list/UI/screens/home/home_view.dart';
import 'package:shared_shopping_list/UI/screens/login/login_view.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/add_new_item_to_recipe_view.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/edit_recipe_view.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/recipes_list_view.dart';
import 'package:shared_shopping_list/UI/screens/shopping_list/shopping_list_view.dart';
import 'package:shared_shopping_list/UI/screens/add_new_item/add_new_item_view.dart';
import 'package:shared_shopping_list/UI/screens/add_new_item_from_recipe/add_new_item_from_recipe_view.dart';
import 'package:shared_shopping_list/UI/screens/add_new_item_from_recipe/choose_item_from_recipe_view.dart';
import 'package:shared_shopping_list/repositories/recipes_repository.dart';
import 'package:shared_shopping_list/repositories/shopping_lists_repository.dart';
import 'package:shared_shopping_list/services/random_generator_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/new_recipe_name_view.dart';

// Hey boys, if you will be adding here something you need to run this command in classic command line from the project root directory:
//    flutter pub run build_runner watch --delete-conflicting-outputs
// It will regenerate app.locator.dart and app.router.dart files

@StackedApp(routes: [
  MaterialRoute(page: LoginView, initial: true),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: ShoppingListView),
  MaterialRoute(page: RecipesListView),
  MaterialRoute(page: CreateOrUpdateShoppingListView),
  MaterialRoute(page: AddNewItemToRecipe),
  MaterialRoute(page: EditRecipeView),
  MaterialRoute(page: NewRecipeNameView),
  MaterialRoute(page: AddNewItemView),
  MaterialRoute(page: AddNewItemFromRecipeView),
  MaterialRoute(page: ChooseItemFromRecipeView),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: ShoppingListsRepository),
  LazySingleton(classType: RecipesRepository),
  LazySingleton(classType: RandomGeneratorService),
])
class App {}
