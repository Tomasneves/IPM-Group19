import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/recipes_list_view.dart';
import 'package:shared_shopping_list/UI/screens/settings/settings_view.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/shopping_lists_view.dart';
import 'package:shared_shopping_list/models/common/nav_bar_item.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final _controller = PersistentTabController(initialIndex: 1);
  PersistentTabController get controller => _controller;

  final Map<Type, NavBarItem> allNavBarItems = {
    RecipesListView: NavBarItem(
      imagePath: 'assets/images/bowl.png',
      text: 'recipes',
    ),
    ShoppingListsView: NavBarItem(
      imagePath: 'assets/images/hand_hand.png',
      text: 'shopping list',
    ),
    SettingsView: NavBarItem(
      imagePath: 'assets/images/settings.png',
      text: 'settings',
    ),
  };
}
