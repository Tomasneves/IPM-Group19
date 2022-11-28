import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/recipes_list_view.dart';
import 'package:shared_shopping_list/UI/global/green_button.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/add_new_item_to_recipe_viewmodel.dart';
import 'package:shared_shopping_list/models/recipe.dart';
import 'package:stacked/stacked.dart';

class AddNewItemToRecipe
    extends ViewModelBuilderWidget<AddNewItemToRecipeModel> {
  const AddNewItemToRecipe({super.key, required this.recipeId});

  final String recipeId;

  @override
  AddNewItemToRecipeModel viewModelBuilder(BuildContext context) =>
      AddNewItemToRecipeModel();

  @override
  Widget builder(
      BuildContext context, AddNewItemToRecipeModel viewModel, Widget? child) {
    List<RecipeItem> recipeItems = viewModel.getAllRecipeItems(recipeId);

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
                children: [
                  ScreenHeader(text: viewModel.getRecipe(recipeId).recipeName),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: recipeItems
                    .map((e) => InkWell(
                          child: Column(children: [
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 216, 215, 215),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: SizedBox(
                                width: 299,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${e.itemName} ${e.itemAmount}'),
                                      const Icon(Icons.close),
                                    ]),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ]),
                        ))
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10), 
                      backgroundColor: const Color.fromARGB(255, 45, 196, 50),
                    ),
                    onPressed: () {
                      viewModel.goToAddNewItemToRecipe2Screen(recipeId);
                    },
                    child: const Text('+ Add new item'),
                  ),
                ],
              ),
              const SizedBox(height: 140),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                    ),
                    onPressed: () {
                      viewModel.goBack();
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

class AddNewItemToRecipe2
    extends ViewModelBuilderWidget<AddNewItemToRecipeModel2> {
  const AddNewItemToRecipe2({super.key, required this.recipeId});

  final String recipeId;

  @override
  AddNewItemToRecipeModel2 viewModelBuilder(BuildContext context) =>
      AddNewItemToRecipeModel2();

  @override
  Widget builder(
      BuildContext context, AddNewItemToRecipeModel2 viewModel, Widget? child) {
    TextEditingController itemNameController = TextEditingController();
    TextEditingController itemAmountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: SizedBox(
            width: 339,
            child: Column(children: [
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  ScreenHeader(text: 'Adding New Item'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("to ${viewModel.getRecipe(recipeId).recipeName}",
                    style: const TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 339,
                height: 40,
                child: TextField(
                  controller: itemNameController,
                  decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Item name',
                      ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 339,
                height: 40,
                child: TextField(
                  controller: itemAmountController,
                  decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Amount',
                      ),
                ),
              ),
              const SizedBox(height: 30),
              const SizedBox(
                width: 339,
                child: Text(
                  'Suggestions:',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 198, 198, 198),
                    ),
                    onPressed: () {
                      itemNameController.text = "Tomato Sauce";
                      itemAmountController.text = "200ml";
                    },
                    child: const Text('Tomato Sauce 200ml'),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 198, 198, 198),
                    ),
                    onPressed: () {
                      itemNameController.text = "Pasta";
                      itemAmountController.text = "300g";
                    },
                    child: const Text('Pasta 300g'),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 198, 198, 198),
                    ),
                    onPressed: () {
                      itemNameController.text = "Olive Oil";
                      itemAmountController.text = "500ml";
                    },
                    child: const Text('Olive Oil 500ml'),
                  ),
                ],
              ),
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    ),
                    onPressed: () {
                      viewModel.addItemAndGoBack(recipeId, itemNameController.text.toString(), itemAmountController.text.toString());
                    },
                    child: const Text('Done'),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
