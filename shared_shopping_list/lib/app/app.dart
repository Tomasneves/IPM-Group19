import 'package:shared_shopping_list/UI/screens/create_new_shopping_list/create_new_shopping_list_view.dart';
import 'package:shared_shopping_list/UI/screens/home/home_view.dart';
import 'package:shared_shopping_list/UI/screens/shopping_list/shopping_list_view.dart';
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
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: ShoppingListsRepository),
  LazySingleton(classType: RandomGeneratorService),
])
class App {}
