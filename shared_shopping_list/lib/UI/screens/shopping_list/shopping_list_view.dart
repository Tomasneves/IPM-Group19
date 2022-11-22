import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/global/green_button.dart';
import 'package:shared_shopping_list/UI/global/blue_button.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/UI/screens/shopping_list/shopping_list_viewmodel.dart';
import 'package:shared_shopping_list/models/shopping_list.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_shopping_list/extensions/extensions.dart';

class ShoppingListView extends ViewModelBuilderWidget<ShoppingListViewModel> {
  //final ShoppingList currentList;
  //const ShoppingListView(ShoppingList currentList, {Key? key}) : super(key: key);
  const ShoppingListView({Key? key}) : super(key: key);

  @override
  ShoppingListViewModel viewModelBuilder(BuildContext context) => ShoppingListViewModel();

  @override
  Widget builder(BuildContext context, ShoppingListViewModel viewModel, Widget? child) {
    final currentList = ModalRoute.of(context)!.settings.arguments as ShoppingList;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ScreenHeader(text: currentList.listName),
                  GreenButton(text: 'Invite friends', onTap: (){print("tap");}),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentList.shopName,
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    currentList.timeOfPlannedShopping
                        .defaultDateTimeFormat(MaterialLocalizations.of(context)),
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${currentList.participantNames.length} participants',
                    style: const TextStyle(fontSize: 14),
                  ),
                ]
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
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
                  ],
                  rows: currentList.items.map((e) => DataRow(
                    cells: <DataCell>[
                      DataCell(Text(e.itemName)),
                      DataCell(Text(e.amount)),
                      DataCell(Text(e.owner)),
                    ]
                  )).toList()
                ),
              ),
              const SizedBox(height: 10),
              BlueButton(text: "Add item", onTap: viewModel.goToAddNewItemScreen),
              const SizedBox(height: 10),
              BlueButton(text: "Add item from recipe", onTap: viewModel.goToAddNewItemFromRecipeScreen,),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
} 
