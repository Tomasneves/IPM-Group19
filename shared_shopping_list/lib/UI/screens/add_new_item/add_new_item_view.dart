import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/screens/add_new_item/add_new_item_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_shopping_list/models/shopping_list.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/UI/global/blue_button.dart';
import 'package:shared_shopping_list/UI/screens/shopping_list/shopping_list_viewmodel.dart';

class AddNewItemView extends ViewModelBuilderWidget<AddNewItemViewModel> {
  final String listId;

  const AddNewItemView(this.listId, {Key? key})
      : super(key: key);

  @override
  AddNewItemViewModel viewModelBuilder(BuildContext context) =>
      AddNewItemViewModel();

  @override
  Widget builder(
      BuildContext context, AddNewItemViewModel viewModel, Widget? child) {
    TextEditingController itemTextController = TextEditingController();
    TextEditingController amountTextController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: WillPopScope(
        onWillPop: () async {
          FocusManager.instance.primaryFocus?.unfocus();
          Navigator.pop(context, false);
          return false;
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                const SizedBox(height: 10),
                ScreenHeader(text: viewModel.getListById(listId).listName),
                const SizedBox(height: 30),
                const Text("Item name:"),
                const SizedBox(height: 10),
                TextField(
                  controller: itemTextController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'e.g. Milk',
                  ),
                ),
                const Text("Amount:"),
                const SizedBox(height: 10),
                TextField(
                  controller: amountTextController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'e.g. 1l',
                  ),
                ),
                const SizedBox(height: 30),
                BlueButton(
                    text: "Add item to list",
                    onTap: () => {
                          FocusManager.instance.primaryFocus?.unfocus(),
                          viewModel.addItem(
                              listId,
                              Item(
                                  itemName: itemTextController.text.toString(),
                                  amount: amountTextController.text.toString(),
                                  owner: "You")),
                        })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
