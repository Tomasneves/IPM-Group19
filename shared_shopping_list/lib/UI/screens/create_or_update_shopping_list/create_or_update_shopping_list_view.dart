import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/global/blue_button.dart';
import 'package:shared_shopping_list/UI/global/rounded_outlined_card.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/UI/global/blue_button.dart';
import 'package:shared_shopping_list/UI/screens/create_or_update_shopping_list/create_or_update_shopping_list_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/cupertino.dart';

class CreateOrUpdateShoppingListView
    extends ViewModelBuilderWidget<CreateOrUpdateShoppingListViewModel> {
  final String? existingShoppingListId;

  final nameTextController = TextEditingController();
  final shopTextController = TextEditingController();

  CreateOrUpdateShoppingListView(this.existingShoppingListId, {Key? key}) : super(key: key);

  @override
  CreateOrUpdateShoppingListViewModel viewModelBuilder(BuildContext context) =>
      CreateOrUpdateShoppingListViewModel(
        existingShoppingListId,
      );

  @override
  void onViewModelReady(CreateOrUpdateShoppingListViewModel viewModel) {
    nameTextController.text = viewModel.currentEditingShoppingList.listName;
    shopTextController.text = viewModel.currentEditingShoppingList.shopName;
  }

  @override
  Widget builder(
      BuildContext context, CreateOrUpdateShoppingListViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ScreenHeader(
                        text:
                            "${existingShoppingListId == null ? 'Create new' : 'Edit'} Shopping List",
                      ),
                      //GreenButton(text: 'Invite friends', onTap: (){print("tap");}),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(width: 0),
                      Text(
                        "List name",
                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: nameTextController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "e.g. Alice's", //TODO: use current user's name
                          ),
                          onChanged: viewModel.updateListNameOfShoppingList,
                        ),
                      ),
                      const SizedBox(width: 20)
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(width: 0),
                      Text(
                        "Shop name",
                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: shopTextController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'e.g. Continente',
                          ),
                          onChanged: viewModel.updateShopNameOfShoppingList,
                        ),
                      ),
                      const SizedBox(width: 20)
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(width: 0),
                        Text(
                          "Date & Time",
                          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        Expanded(
                          child: CupertinoTheme(
                            data: CupertinoThemeData(
                              textTheme: CupertinoTextThemeData(
                                dateTimePickerTextStyle:
                                    TextStyle(fontSize: 15, color: Colors.black.withOpacity(1.0)),
                              ),
                            ),
                            child: CupertinoDatePicker(
                              minuteInterval: 1,
                              initialDateTime:
                                  viewModel.currentEditingShoppingList.timeOfPlannedShopping,
                              use24hFormat: true,
                              // This is called when the user changes the dateTime.
                              onDateTimeChanged: viewModel.updateTimeOfShoppingList,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10)
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  /*
                  Expanded(
                    child: SingleChildScrollView(
                      child: DataTable(
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Participants',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),

                            DataColumn(label: Text(' '))
                          ],
                          rows: viewModel.getListById(listId).participantNames
                              .map((e) => DataRow(cells: <DataCell>[
                            DataCell(Text(e)),
                            DataCell(RemoveFromListButton(
                              listId: listId,
                              id: viewModel.getListById(listId).participantNames.indexOf(e),
                              removePress: viewModel.removeParticipant,
                            ))
                          ]))
                              .toList()),
                    ),
                  )*/
                  const SizedBox(height: 240),
                  /*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:[
                      DefaultButton(text: "Add participants", color:CustomColors.darkYellow)
                  ]
                  ),
                   */
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BlueButton(
                        onTap: () {
                          if (existingShoppingListId == null) {
                            viewModel.createShoppingListAndGoBack();
                          } else {
                            viewModel.saveChangesToShoppingListAndGoBack();
                          }
                        },
                        text: existingShoppingListId == null ? 'Create' : 'Save changes',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ])),
          ),
        ),
      ),
    );
  }
}
