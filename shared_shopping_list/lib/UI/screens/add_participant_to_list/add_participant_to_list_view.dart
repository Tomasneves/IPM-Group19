import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/global/blue_button.dart';
import 'package:shared_shopping_list/UI/global/rounded_outlined_card.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/UI/global/blue_button.dart';
import 'package:shared_shopping_list/UI/screens/create_or_update_shopping_list/create_or_update_shopping_list_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/cupertino.dart';

import '../../../constants/custom_colors.dart';
import '../../../models/shopping_list.dart';
import '../../global/default_button.dart';
import 'CustomSearchDelegate.dart';
import 'add_participant_to_list_viewmodel.dart';

class AddParticipantToListView
    extends ViewModelBuilderWidget<AddParticipantToListViewModel> {
  final String? existingShoppingListId;

  final nameTextController = TextEditingController();
  final shopTextController = TextEditingController();

  AddParticipantToListView(this.existingShoppingListId, {Key? key})
      : super(key: key);

  @override
  AddParticipantToListViewModel viewModelBuilder(BuildContext context) =>
      AddParticipantToListViewModel(
        existingShoppingListId,
      );

  @override
  void onViewModelReady(AddParticipantToListViewModel viewModel) {
    nameTextController.text = viewModel.currentEditingShoppingList.listName;
    shopTextController.text = viewModel.currentEditingShoppingList.shopName;
  }

  @override
  Widget builder(BuildContext context, AddParticipantToListViewModel viewModel,
      Widget? child) {
    List participants = <String>[];
    participants.add("jose");
    participants.add("maria");
    if (existingShoppingListId == null) {
    } else {
      final list = viewModel.getListById(existingShoppingListId!);
      participants = list.participantNames;
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate()
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(






              ),
            ),
          ),
        ),
      ),
    );
  }
}
