import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/recipes_list_view.dart';
import 'package:shared_shopping_list/UI/global/green_button.dart';
import 'package:shared_shopping_list/UI/global/rounded_outlined_card.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/local_widgets/shopping_list_brief_info.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/add_new_item_to_recipemodel.dart';
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
    List<RecipeItem> recipeItem = viewModel.getAllRecipeItems(recipeId);

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
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ))
                ],
              ),
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
                children: recipeItem
                    .map((e) => InkWell(
                          child: Column(children: [
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 216, 215, 215),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: SizedBox(
                                width: 299,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(e.itemName + ' ' + e.itemAmount),
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
                      primary: Color.fromARGB(255, 45, 196, 50),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return AddNewItemToRecipe2(recipeId: recipeId);
                      }));
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
                      primary: Colors.blue,
                      padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return RecipesListView();
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
    ;
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
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: SizedBox(
            width: 339,
            child: Column(children: [
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return AddNewItemToRecipe(
                          recipeId: '2',
                        );
                      }));
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                    style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const ScreenHeader(text: 'Adding New Item'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'To Lasagna Recipie',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 339,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.white)),
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: 'Item Description',
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    filled: true,
                    fillColor: Color.fromARGB(255, 198, 198, 198),
                  ),
                  controller: itemNameController,
                ),
              ),
              const SizedBox(height: 30),
              const SizedBox(
                width: 339,
                child: const Text(
                  'Suggestions:',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 198, 198, 198),
                    ),
                    onPressed: () {
                      viewModel.getRecipe(recipeId).items.add(RecipeItem(
                          itemName: 'Tomato Sauce', itemAmount: '200ml'));

                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return AddNewItemToRecipe(recipeId: recipeId);
                      }));
                    },
                    child: const Text('Tomato Sauce 200ml'),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 198, 198, 198),
                    ),
                    onPressed: () {
                      viewModel.getRecipe(recipeId).items.add(
                          RecipeItem(itemName: 'Pasta', itemAmount: '300g'));

                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return AddNewItemToRecipe(recipeId: recipeId);
                      }));
                    },
                    child: const Text('Pasta 300g'),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 198, 198, 198),
                    ),
                    onPressed: () {
                      viewModel.getRecipe(recipeId).items.add(RecipeItem(
                          itemName: 'Olive Oil', itemAmount: '500ml'));

                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return AddNewItemToRecipe(recipeId: recipeId);
                      }));
                    },
                    child: const Text('Olive Oil 500ml'),
                  ),
                ],
              ),
              SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    ),
                    onPressed: () {
                      viewModel.getRecipe(recipeId).items.add(RecipeItem(
                          itemName: itemNameController.text, itemAmount: '1g'));

                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return AddNewItemToRecipe(recipeId: '2');
                      }));
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
    ;
  }
}
