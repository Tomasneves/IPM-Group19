import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/add_new_item_to_recipe_view.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/recipes_list_viewmodel.dart';
import 'package:shared_shopping_list/UI/global/green_button.dart';
import 'package:shared_shopping_list/UI/global/rounded_outlined_card.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/local_widgets/shopping_list_brief_info.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/shopping_lists_viewmodel.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/new_recipe_name_view.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/new_recipe_name_view.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_shopping_list/models/recipe.dart';
import 'package:shared_shopping_list/UI/global/recipe_box.dart';

class RecipesListView extends ViewModelBuilderWidget<RecipesListViewModel> {
  const RecipesListView({Key? key}) : super(key: key);

  @override
  RecipesListViewModel viewModelBuilder(BuildContext context) =>
      RecipesListViewModel();

  @override
  Widget builder(
      BuildContext context, RecipesListViewModel viewModel, Widget? child) {
    List<Recipe> recipes = viewModel.getAllRecipe();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const ScreenHeader(text: 'My Recipes'),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 45, 196, 50),
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          textStyle: const TextStyle(fontSize: 18)),
                      onPressed: () {
                        viewModel.goToNewRecipeNameScreen();
                      },
                      child: const Text('add new'))
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                    primary: false,
                    childAspectRatio: (1 / .7),
                    crossAxisCount: 2,
                    crossAxisSpacing: 50,
                    mainAxisSpacing: 30,
                    children:
                      recipes.map((e) => InkWell(
                        onTap: () => viewModel.goToEditRecipe(e.id),
                        child: RecipeBox(
                            recipe: e,
                          ),)).toList(),
                  ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
