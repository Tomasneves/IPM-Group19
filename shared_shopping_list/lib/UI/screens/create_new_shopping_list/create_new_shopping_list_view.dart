import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/global/blue_button.dart';
import 'package:shared_shopping_list/UI/global/rounded_outlined_card.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/UI/screens/create_new_shopping_list/create_new_shopping_list_viewmodel.dart';
import 'package:shared_shopping_list/UI/screens/shopping_list/shopping_list_viewmodel.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/local_widgets/shopping_list_brief_info.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/shopping_lists_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CreateNewShoppingListView extends ViewModelBuilderWidget<CreateNewShoppingListViewModel> {
  const CreateNewShoppingListView({Key? key}) : super(key: key);

  @override
  CreateNewShoppingListViewModel viewModelBuilder(BuildContext context) =>
      CreateNewShoppingListViewModel();

  @override
  Widget builder(BuildContext context, CreateNewShoppingListViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
        child: BlueButton(
          text: 'Add new random Shopping list',
          onTap: viewModel.addNewRandomShoppingListAndGoBack,
        ),
      )),
    );
  }
}
