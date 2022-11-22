import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/screens/add_new_item_from_recipe/add_new_item_from_recipe_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AddNewItemFromRecipeView extends ViewModelBuilderWidget<AddNewItemFromRecipeViewModel> {
  const AddNewItemFromRecipeView({Key? key}) : super(key: key);

  @override
  AddNewItemFromRecipeViewModel viewModelBuilder(BuildContext context) => AddNewItemFromRecipeViewModel();

  @override
  Widget builder(BuildContext context, AddNewItemFromRecipeViewModel viewModel, Widget? child) {

    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        bottom: false,
        child: Text('add item from recipe screen'),
      ),
    );
  }
}
