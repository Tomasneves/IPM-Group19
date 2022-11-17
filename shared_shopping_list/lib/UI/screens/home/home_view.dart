import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:shared_shopping_list/UI/screens/home/home_viewmodel.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/recipes_list_view.dart';
import 'package:shared_shopping_list/UI/screens/settings/settings_view.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/shopping_lists_view.dart';
import 'package:shared_shopping_list/constants/custom_colors.dart';
import 'package:shared_shopping_list/models/common/nav_bar_item.dart';
import 'package:stacked/stacked.dart';

class HomeView extends ViewModelBuilderWidget<HomeViewModel> {
  const HomeView({super.key});

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  List<Widget> getPages(Map<Type, NavBarItem> allowedPages) {
    return [const RecipesListView(), const ShoppingListsView(), const SettingsView()];
  }

  List<PersistentBottomNavBarItem> getNavBarItems(Map<Type, NavBarItem> pages) {
    final List<PersistentBottomNavBarItem> items = [];
    pages.forEach((key, value) {
      items.add(PersistentBottomNavBarItem(
        icon: Image.asset(
          value.imagePath,
          width: 70,
          height: 70,
        ),
        activeColorPrimary: CustomColors.lightGreen,
        inactiveColorPrimary: CustomColors.grey500,
        title: value.text,
      ));
    });
    return items;
  }

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(
        context,
      ).padding.bottom),
      child: PersistentTabView(
        context,
        controller: viewModel.controller,
        screens: getPages(viewModel.allNavBarItems),
        items: getNavBarItems(viewModel.allNavBarItems),
        confineInSafeArea: false,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        onItemSelected: (index) {
          // viewModel.logSelectedScreen(index);
        },
        decoration: const NavBarDecoration(
          border: Border(
            top: BorderSide(
              color: CustomColors.grey500,
              width: 0.4,
            ),
          ),
        ),
        navBarHeight: 130,
        padding: const NavBarPadding.only(left: 0, right: 0),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style3, // Choose the nav bar style with this property.
      ),
    );
  }
}
