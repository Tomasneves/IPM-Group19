import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/global/recipe_box.dart';
import 'package:shared_shopping_list/UI/screens/add_new_item_from_recipe/add_new_item_from_recipe_viewmodel.dart';
import 'package:shared_shopping_list/models/recipe.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';

class AddNewItemFromRecipeView
    extends ViewModelBuilderWidget<AddNewItemFromRecipeViewModel> {
  final String listId;

  const AddNewItemFromRecipeView(this.listId, {Key? key}) : super(key: key);

  @override
  AddNewItemFromRecipeViewModel viewModelBuilder(BuildContext context) =>
      AddNewItemFromRecipeViewModel();

  @override
  Widget builder(BuildContext context, AddNewItemFromRecipeViewModel viewModel, Widget? child) {
    
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          //bottom: false,
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            ScreenHeader(text: viewModel.getListById(listId).listName),
            const SizedBox(height: 30),
            const Text("Select recipe to open", style: const TextStyle(fontSize: 18),),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.count( 
                primary: false,
                childAspectRatio: (1 / .7),
                crossAxisCount: 2,
                crossAxisSpacing: 50,
                mainAxisSpacing: 30,
                children: viewModel.allRecipes
                    .map(
                      (e) => InkWell(
                        onTap: () => print(e.recipeName),
                        child: RecipeBox(recipe: e, ),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      )),
    );
  }
}
