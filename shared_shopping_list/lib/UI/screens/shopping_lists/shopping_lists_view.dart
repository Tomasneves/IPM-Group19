import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/global/green_button.dart';
import 'package:shared_shopping_list/UI/global/rounded_outlined_card.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/local_widgets/shopping_list_brief_info.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/shopping_lists_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ShoppingListsView extends ViewModelBuilderWidget<ShoppingListsViewModel> {
  const ShoppingListsView({Key? key}) : super(key: key);

  @override
  ShoppingListsViewModel viewModelBuilder(BuildContext context) => ShoppingListsViewModel();
 
  @override
  Widget builder(BuildContext context, ShoppingListsViewModel viewModel, Widget? child) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const ScreenHeader(text: 'Shopping lists'),
                  GreenButton(text: 'add new', onTap: viewModel.goToCreateNewShoppingListScreen),
                ],
              ),
              const SizedBox(height: 40),
              Column(
                children: viewModel.allShoppingLists
                    .map(
                      (e) => InkWell(
                        onTap: () => viewModel.goToShoppingListScreen(e),
                        child: RoundedOutlinedCard(
                          title: e.listName,
                          content: ShoppingListBriefInfo(
                            shoppingList: e,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 20),
              Text('You are a participant in ${viewModel.allShoppingLists.length} shopping lists'),
            ],
          ),
        ),
      ),
    );
  }
}
