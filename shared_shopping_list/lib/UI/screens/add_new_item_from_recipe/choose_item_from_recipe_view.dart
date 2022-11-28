import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/screens/add_new_item_from_recipe/choose_item_from_recipe_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/UI/global/blue_button.dart';

class ChooseItemFromRecipeView
    extends ViewModelBuilderWidget<ChooseItemFromRecipeViewModel> {
  final String listId;
  final String recipeId;

  const ChooseItemFromRecipeView(this.listId, this.recipeId, {Key? key})
      : super(key: key);

  @override
  ChooseItemFromRecipeViewModel viewModelBuilder(BuildContext context) =>
      ChooseItemFromRecipeViewModel();

  @override
  Widget builder(BuildContext context, ChooseItemFromRecipeViewModel viewModel,
      Widget? child) {
    final list = viewModel.getListById(listId);
    final recipe = viewModel.getRecipeById(recipeId);
    final selectedRows = viewModel.getSelectedRows();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                ScreenHeader(text: list.listName),
                const SizedBox(height: 30),
                SingleChildScrollView(
                  child: DataTable(
                    showCheckboxColumn: true,
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
                    ],
                    rows: recipe.items
                        .map((e) => DataRow(
                              cells: <DataCell>[
                                DataCell(Text(e.itemName)),
                                DataCell(Text(e.itemAmount)),
                              ],
                              selected: selectedRows[recipe.items.indexOf(e)],
                              onSelectChanged: (value) {
                                final index = recipe.items.indexOf(e);
                                viewModel.changeSelecedRows(index);
                              },
                            ))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 30),
                BlueButton(
                  text: "Add selected",
                  onTap: () =>
                      viewModel.addSelectedItemsAndGoBack(listId, recipeId),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
