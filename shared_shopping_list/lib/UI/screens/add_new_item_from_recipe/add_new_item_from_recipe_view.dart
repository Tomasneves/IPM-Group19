import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/screens/add_new_item_from_recipe/add_new_item_from_recipe_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_shopping_list/models/shopping_list.dart';
import 'package:shared_shopping_list/UI/screens/shopping_list/shopping_list_viewmodel.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';

class AddNewItemFromRecipeView extends ViewModelBuilderWidget<AddNewItemFromRecipeViewModel> {
  final ShoppingList currentList;
  final ShoppingListViewModel shoppingListViewModel;

  const AddNewItemFromRecipeView(this.currentList, this.shoppingListViewModel, {Key? key}) : super(key: key);

  @override
  AddNewItemFromRecipeViewModel viewModelBuilder(BuildContext context) => AddNewItemFromRecipeViewModel();

  @override
  Widget builder(BuildContext context, AddNewItemFromRecipeViewModel viewModel, Widget? child) {

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        //bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              ScreenHeader(text: currentList.listName),
              const SizedBox(height: 30),
              const Text("Select recipe to open"),
              //TODO add list of recipes (as boxes)
            ],
          ),
        )
      ),
    );
  }
}