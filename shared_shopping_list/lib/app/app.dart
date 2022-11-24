// Here you can define the Routes. You can think of a Route as a Screen, but there can be some differences.
// Here you can also register all the services, which then can be accessed as a Singleton thorough the whole app through Locator 

import 'package:shared_shopping_list/UI/screens/create_new_shopping_list/create_new_shopping_list_view.dart';
import 'package:shared_shopping_list/UI/screens/home/home_view.dart';
import 'package:shared_shopping_list/UI/screens/shopping_list/shopping_list_view.dart';
import 'package:shared_shopping_list/UI/screens/add_new_item/add_new_item_view.dart';
import 'package:shared_shopping_list/UI/screens/add_new_item_from_recipe/add_new_item_from_recipe_view.dart';
import 'package:shared_shopping_list/repositories/recipes_repository.dart';
import 'package:shared_shopping_list/repositories/shopping_lists_repository.dart';
import 'package:shared_shopping_list/services/random_generator_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

// Hey boys, if you will be adding here something you need to run this command in classic command line from the project root directory:
//    flutter pub run build_runner watch --delete-conflicting-outputs
// It will regenerate app.locator.dart and app.router.dart files

@StackedApp(routes: [
  MaterialRoute(page: HomeView, initial: true),
  MaterialRoute(page: ShoppingListView),
  MaterialRoute(page: CreateNewShoppingListView),
  MaterialRoute(page: AddNewItemView),
  MaterialRoute(page: AddNewItemFromRecipeView),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: ShoppingListsRepository),
  LazySingleton(classType: RecipesRepository),
  LazySingleton(classType: RandomGeneratorService),
])
class App {}
