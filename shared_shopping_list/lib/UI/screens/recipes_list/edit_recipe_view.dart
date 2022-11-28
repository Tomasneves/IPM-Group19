import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/global/delete_from_list_button.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/edit_recipe_viewmodel.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/models/recipe.dart';
import 'package:stacked/stacked.dart';

class EditRecipeView extends ViewModelBuilderWidget<EditRecipeViewModel> {
  const EditRecipeView({super.key, required this.recipeId});

  final String recipeId;

  @override
  EditRecipeViewModel viewModelBuilder(BuildContext context) =>
      EditRecipeViewModel();

  @override
  Widget builder(
      BuildContext context, EditRecipeViewModel viewModel, Widget? child) {
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
              DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Item',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Amount',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(label: Text(' '))
                    ],
                    rows: recipeItems
                        .map((e) => DataRow(cells: <DataCell>[
                              DataCell(Text(e.itemName)),
                              DataCell(Text(e.itemAmount)),
                              DataCell(DeleteFromListButton(
                                listId: recipeId,
                                id: recipeItems.indexOf(e),
                                deletePress: viewModel.deleteItem,
                              ))
                            ]))
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
                      viewModel.goToAddNewItemToRecipeScreen(recipeId);
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
