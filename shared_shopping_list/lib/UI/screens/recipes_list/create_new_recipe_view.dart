import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/create_new_recipe_viewmodel.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/recipes_list_view.dart';
import 'package:shared_shopping_list/UI/global/green_button.dart';
import 'package:shared_shopping_list/UI/global/rounded_outlined_card.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/local_widgets/shopping_list_brief_info.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/create_new_recipe_viewmodel.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/add_new_item_to_recipe.dart';
import 'package:stacked/stacked.dart';

class CreateNewRecipeView
    extends ViewModelBuilderWidget<CreateNewRecipeViewModel> {
  CreateNewRecipeView({super.key});

  @override
  CreateNewRecipeViewModel viewModelBuilder(BuildContext context) =>
      CreateNewRecipeViewModel();

  @override
  Widget builder(
      BuildContext context, CreateNewRecipeViewModel viewModel, Widget? child) {
    TextEditingController recipeNameController = TextEditingController();

    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 80),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return RecipesListView();
                        }));
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const ScreenHeader(text: 'Create New Recipe'),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Recipe Name:',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 189,
                    height: 30,
                    child: TextField(
                      controller: recipeNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white)),
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Color.fromARGB(255, 198, 198, 198),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 360),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                    ),
                    onPressed: () {
                      String newRecipeId =
                          viewModel.createRecipe(recipeNameController.text);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return AddNewItemToRecipe(recipeId: newRecipeId);
                      }));
                    },
                    child: const Text('Done'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
