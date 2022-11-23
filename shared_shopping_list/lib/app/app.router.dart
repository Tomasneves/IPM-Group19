// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/screens/add_new_item/add_new_item_view.dart'
    as _i5;
import 'package:shared_shopping_list/UI/screens/add_new_item_from_recipe/add_new_item_from_recipe_view.dart'
    as _i6;
import 'package:shared_shopping_list/UI/screens/create_new_shopping_list/create_new_shopping_list_view.dart'
    as _i4;
import 'package:shared_shopping_list/UI/screens/home/home_view.dart' as _i2;
import 'package:shared_shopping_list/UI/screens/shopping_list/shopping_list_view.dart'
    as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;

class Routes {
  static const homeView = '/';

  static const shoppingListView = '/shopping-list-view';

  static const createNewShoppingListView = '/create-new-shopping-list-view';

  static const addNewItemView = '/add-new-item-view';

  static const addNewItemFromRecipeView = '/add-new-item-from-recipe-view';

  static const all = <String>{
    homeView,
    shoppingListView,
    createNewShoppingListView,
    addNewItemView,
    addNewItemFromRecipeView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.shoppingListView,
      page: _i3.ShoppingListView,
    ),
    _i1.RouteDef(
      Routes.createNewShoppingListView,
      page: _i4.CreateNewShoppingListView,
    ),
    _i1.RouteDef(
      Routes.addNewItemView,
      page: _i5.AddNewItemView,
    ),
    _i1.RouteDef(
      Routes.addNewItemFromRecipeView,
      page: _i6.AddNewItemFromRecipeView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.ShoppingListView: (data) {
      final args = data.getArgs<ShoppingListViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i3.ShoppingListView(args.listId, key: args.key),
        settings: data,
      );
    },
    _i4.CreateNewShoppingListView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.CreateNewShoppingListView(),
        settings: data,
      );
    },
    _i5.AddNewItemView: (data) {
      final args = data.getArgs<AddNewItemViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i5.AddNewItemView(args.listId, key: args.key),
        settings: data,
      );
    },
    _i6.AddNewItemFromRecipeView: (data) {
      final args =
          data.getArgs<AddNewItemFromRecipeViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i6.AddNewItemFromRecipeView(args.listId, key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ShoppingListViewArguments {
  const ShoppingListViewArguments({
    required this.listId,
    this.key,
  });

  final String listId;

  final _i7.Key? key;
}

class AddNewItemViewArguments {
  const AddNewItemViewArguments({
    required this.listId,
    this.key,
  });

  final String listId;

  final _i7.Key? key;
}

class AddNewItemFromRecipeViewArguments {
  const AddNewItemFromRecipeViewArguments({
    required this.listId,
    this.key,
  });

  final String listId;

  final _i7.Key? key;
}

extension NavigatorStateExtension on _i8.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToShoppingListView({
    required String listId,
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.shoppingListView,
        arguments: ShoppingListViewArguments(listId: listId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateNewShoppingListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createNewShoppingListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddNewItemView({
    required String listId,
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addNewItemView,
        arguments: AddNewItemViewArguments(listId: listId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddNewItemFromRecipeView({
    required String listId,
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addNewItemFromRecipeView,
        arguments: AddNewItemFromRecipeViewArguments(listId: listId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
