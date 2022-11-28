import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/global/green_button.dart';
import 'package:shared_shopping_list/UI/global/blue_button.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/UI/screens/shopping_list/shopping_list_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_shopping_list/extensions/extensions.dart';
import 'package:shared_shopping_list/UI/global/delete_from_list_button.dart';

class ShoppingListView extends ViewModelBuilderWidget<ShoppingListViewModel> {
  final String listId;

  const ShoppingListView(this.listId, {Key? key}) : super(key: key);

  @override
  ShoppingListViewModel viewModelBuilder(BuildContext context) =>
      ShoppingListViewModel();

  @override
  Widget builder(
      BuildContext context, ShoppingListViewModel viewModel, Widget? child) {
    final list = viewModel.getListById(listId);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ScreenHeader(text: list.listName),
                  GreenButton(
                    text: 'Edit list',
                    onTap: () =>
                        viewModel.goToEditCurrentShoppingListScreen(listId),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  viewModel.getListById(listId).shopName,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                Text(
                  list.timeOfPlannedShopping
                      .defaultDateTimeFormat(MaterialLocalizations.of(context)),
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  '${list.participantNames.length} participants',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        const TextSpan(text: 'Next person to go to shop: '),
                        TextSpan(
                            text: list.currentShopper,
                            style: const TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.bold)),
                      ]),
                ),
              ]),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Item',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Amount',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Added by',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(label: Text(' '))
                    ],
                    rows: list.items
                        .map((e) => DataRow(cells: <DataCell>[
                              DataCell(Text(e.itemName)),
                              DataCell(Text(e.amount)),
                              DataCell(Text(e.owner)),
                              DataCell(DeleteFromListButton(
                                listId: listId,
                                id: list.items.indexOf(e),
                                deletePress: viewModel.deleteItem,
                              ))
                            ]))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              BlueButton(
                  text: "Add item",
                  onTap: () => viewModel.goToAddNewItemScreen(listId)),
              const SizedBox(height: 10),
              BlueButton(
                  text: "Add item from recipe",
                  onTap: () =>
                      viewModel.goToAddNewItemFromRecipeScreen(listId)),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
