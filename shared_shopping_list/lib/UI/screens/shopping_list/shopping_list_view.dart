import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/global/rounded_outlined_card.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/UI/screens/shopping_list/shopping_list_viewmodel.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/local_widgets/shopping_list_brief_info.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/shopping_lists_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ShoppingListView extends ViewModelBuilderWidget<ShoppingListViewModel> {
  const ShoppingListView({Key? key}) : super(key: key);

  @override
  ShoppingListViewModel viewModelBuilder(BuildContext context) => ShoppingListViewModel();

  @override
  Widget builder(BuildContext context, ShoppingListViewModel viewModel, Widget? child) {
    return Scaffold(
      body: SafeArea(
        child: Text('sdf'),
      ),
    );
  }
}
