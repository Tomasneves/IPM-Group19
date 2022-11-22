import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/screens/add_new_item/add_new_item_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AddNewItemView extends ViewModelBuilderWidget<AddNewItemViewModel> {
  const AddNewItemView({Key? key}) : super(key: key);

  @override
  AddNewItemViewModel viewModelBuilder(BuildContext context) => AddNewItemViewModel();

  @override
  Widget builder(BuildContext context, AddNewItemViewModel viewModel, Widget? child) {
    //final currentList = ModalRoute.of(context)!.settings.arguments as ShoppingList;

    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        bottom: false,
        child: Text('add item screen'),
      ),
    );
  }
}
