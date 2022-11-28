// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i11;
import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/screens/add_new_item/add_new_item_view.dart'
    as _i8;
import 'package:shared_shopping_list/UI/screens/add_new_item_from_recipe/add_new_item_from_recipe_view.dart'
    as _i9;
import 'package:shared_shopping_list/UI/screens/add_new_item_from_recipe/choose_item_from_recipe_view.dart'
    as _i10;
import 'package:shared_shopping_list/UI/screens/create_or_update_shopping_list/create_or_update_shopping_list_view.dart'
    as _i5;
import 'package:shared_shopping_list/UI/screens/home/home_view.dart' as _i2;
import 'package:shared_shopping_list/UI/screens/recipes_list/add_new_item_to_recipe_view.dart'
    as _i6;
import 'package:shared_shopping_list/UI/screens/recipes_list/create_new_recipe_view.dart'
    as _i7;
import 'package:shared_shopping_list/UI/screens/recipes_list/recipes_list_view.dart'
    as _i4;
import 'package:shared_shopping_list/UI/screens/shopping_list/shopping_list_view.dart'
    as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i12;

class Routes {
  static const homeView = '/';

  static const shoppingListView = '/shopping-list-view';

  static const recipesListView = '/recipes-list-view';

  static const createOrUpdateShoppingListView =
      '/create-or-update-shopping-list-view';

  static const addNewItemToRecipe = '/add-new-item-to-recipe';

  static const addNewItemToRecipe2 = '/add-new-item-to-recipe2';

  static const createNewRecipeView = '/create-new-recipe-view';

  static const addNewItemView = '/add-new-item-view';

  static const addNewItemFromRecipeView = '/add-new-item-from-recipe-view';

  static const chooseItemFromRecipeView = '/choose-item-from-recipe-view';

  static const all = <String>{
    homeView,
    shoppingListView,
    recipesListView,
    createOrUpdateShoppingListView,
    addNewItemToRecipe,
    addNewItemToRecipe2,
    createNewRecipeView,
    addNewItemView,
    addNewItemFromRecipeView,
    chooseItemFromRecipeView,
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
      Routes.recipesListView,
      page: _i4.RecipesListView,
    ),
    _i1.RouteDef(
      Routes.createOrUpdateShoppingListView,
      page: _i5.CreateOrUpdateShoppingListView,
    ),
    _i1.RouteDef(
      Routes.addNewItemToRecipe,
      page: _i6.AddNewItemToRecipe,
    ),
    _i1.RouteDef(
      Routes.addNewItemToRecipe2,
      page: _i6.AddNewItemToRecipe2,
    ),
    _i1.RouteDef(
      Routes.createNewRecipeView,
      page: _i7.CreateNewRecipeView,
    ),
    _i1.RouteDef(
      Routes.addNewItemView,
      page: _i8.AddNewItemView,
    ),
    _i1.RouteDef(
      Routes.addNewItemFromRecipeView,
      page: _i9.AddNewItemFromRecipeView,
    ),
    _i1.RouteDef(
      Routes.chooseItemFromRecipeView,
      page: _i10.ChooseItemFromRecipeView,
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
    _i4.RecipesListView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.RecipesListView(),
        settings: data,
      );
    },
    _i5.CreateOrUpdateShoppingListView: (data) {
      final args =
          data.getArgs<CreateOrUpdateShoppingListViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i5.CreateOrUpdateShoppingListView(
            args.existingShoppingListId,
            key: args.key),
        settings: data,
      );
    },
    _i6.AddNewItemToRecipe: (data) {
      final args = data.getArgs<AddNewItemToRecipeArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i6.AddNewItemToRecipe(key: args.key, recipeId: args.recipeId),
        settings: data,
      );
    },
    _i6.AddNewItemToRecipe2: (data) {
      final args = data.getArgs<AddNewItemToRecipe2Arguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i6.AddNewItemToRecipe2(key: args.key, recipeId: args.recipeId),
        settings: data,
      );
    },
    _i7.CreateNewRecipeView: (data) {
      final args = data.getArgs<CreateNewRecipeViewArguments>(
        orElse: () => const CreateNewRecipeViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i7.CreateNewRecipeView(key: args.key),
        settings: data,
      );
    },
    _i8.AddNewItemView: (data) {
      final args = data.getArgs<AddNewItemViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i8.AddNewItemView(args.listId, key: args.key),
        settings: data,
      );
    },
    _i9.AddNewItemFromRecipeView: (data) {
      final args =
          data.getArgs<AddNewItemFromRecipeViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i9.AddNewItemFromRecipeView(args.listId, key: args.key),
        settings: data,
      );
    },
    _i10.ChooseItemFromRecipeView: (data) {
      final args =
          data.getArgs<ChooseItemFromRecipeViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i10.ChooseItemFromRecipeView(
            args.listId, args.recipeId,
            key: args.key),
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

  final _i11.Key? key;
}

class CreateOrUpdateShoppingListViewArguments {
  const CreateOrUpdateShoppingListViewArguments({
    required this.existingShoppingListId,
    this.key,
  });

  final String? existingShoppingListId;

  final _i11.Key? key;
}

class AddNewItemToRecipeArguments {
  const AddNewItemToRecipeArguments({
    this.key,
    required this.recipeId,
  });

  final _i11.Key? key;

  final String recipeId;
}

class AddNewItemToRecipe2Arguments {
  const AddNewItemToRecipe2Arguments({
    this.key,
    required this.recipeId,
  });

  final _i11.Key? key;

  final String recipeId;
}

class CreateNewRecipeViewArguments {
  const CreateNewRecipeViewArguments({this.key});

  final _i11.Key? key;
}

class AddNewItemViewArguments {
  const AddNewItemViewArguments({
    required this.listId,
    this.key,
  });

  final String listId;

  final _i11.Key? key;
}

class AddNewItemFromRecipeViewArguments {
  const AddNewItemFromRecipeViewArguments({
    required this.listId,
    this.key,
  });

  final String listId;

  final _i11.Key? key;
}

class ChooseItemFromRecipeViewArguments {
  const ChooseItemFromRecipeViewArguments({
    required this.listId,
    required this.recipeId,
    this.key,
  });

  final String listId;

  final String recipeId;

  final _i11.Key? key;
}

extension NavigatorStateExtension on _i12.NavigationService {
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
    _i11.Key? key,
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

  Future<dynamic> navigateToRecipesListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.recipesListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateOrUpdateShoppingListView({
    required String? existingShoppingListId,
    _i11.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createOrUpdateShoppingListView,
        arguments: CreateOrUpdateShoppingListViewArguments(
            existingShoppingListId: existingShoppingListId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddNewItemToRecipe({
    _i11.Key? key,
    required String recipeId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addNewItemToRecipe,
        arguments: AddNewItemToRecipeArguments(key: key, recipeId: recipeId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddNewItemToRecipe2({
    _i11.Key? key,
    required String recipeId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addNewItemToRecipe2,
        arguments: AddNewItemToRecipe2Arguments(key: key, recipeId: recipeId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateNewRecipeView({
    _i11.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createNewRecipeView,
        arguments: CreateNewRecipeViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddNewItemView({
    required String listId,
    _i11.Key? key,
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
    _i11.Key? key,
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

  Future<dynamic> navigateToChooseItemFromRecipeView({
    required String listId,
    required String recipeId,
    _i11.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.chooseItemFromRecipeView,
        arguments: ChooseItemFromRecipeViewArguments(
            listId: listId, recipeId: recipeId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
