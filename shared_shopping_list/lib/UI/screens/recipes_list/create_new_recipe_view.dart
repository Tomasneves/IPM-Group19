import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/create_new_recipe_viewmodel.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/recipes_list_view.dart';
import 'package:shared_shopping_list/UI/global/green_button.dart';
import 'package:shared_shopping_list/UI/global/rounded_outlined_card.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/local_widgets/shopping_list_brief_info.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/create_new_recipe_viewmodel.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/add_new_item_to_recipe_view.dart';
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
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  ScreenHeader(text: 'Create New Recipe'),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Recipe Name:',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 189,
                    height: 30,
                    child: TextField(
                      controller: recipeNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Recipe name',
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
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                    ),
                    onPressed: () {
                      String newRecipeId =
                          viewModel.createRecipe(recipeNameController.text);
                      viewModel.goToAddNewItemToRecipeScreen(newRecipeId);
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
