import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/global/delete_from_list_button.dart';
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
