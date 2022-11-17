import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/recipes_list_viewmodel.dart';
import 'package:stacked/stacked.dart';

class RecipesListView extends ViewModelBuilderWidget<RecipesListViewModel> {
  const RecipesListView({Key? key}) : super(key: key);

  @override
  RecipesListViewModel viewModelBuilder(BuildContext context) => RecipesListViewModel();

  @override
  Widget builder(BuildContext context, RecipesListViewModel viewModel, Widget? child) {
    return const Scaffold(
      body: Center(child: Text('recipes_list_view')),
    );
  }
}
