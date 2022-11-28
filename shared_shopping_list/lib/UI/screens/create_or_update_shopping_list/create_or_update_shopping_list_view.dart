import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/global/blue_button.dart';
import 'package:shared_shopping_list/UI/global/delete_from_list_button.dart';
import 'package:shared_shopping_list/UI/global/rounded_outlined_card.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/UI/global/blue_button.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/local_widgets/CustomSearchDelegate.dart';
import 'package:shared_shopping_list/UI/screens/create_or_update_shopping_list/create_or_update_shopping_list_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/cupertino.dart';

import '../../../constants/custom_colors.dart';
import '../../../models/shopping_list.dart';
import '../../global/default_button.dart';

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
      body: WillPopScope(
        onWillPop: () async {
          FocusManager.instance.primaryFocus?.unfocus();
          Navigator.pop(context, false);
          return false;
        },
        child: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                  SizedBox(
                    width: 350,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                                      dateTimePickerTextStyle: TextStyle(
                                          fontSize: 15, color: Colors.black.withOpacity(1.0)),
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
                        const SizedBox(height: 30),
                        Text(
                          "Participants",
                          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 300,
                          height: 150,
                          child: SingleChildScrollView(
                            child: DataTable(
                              headingRowHeight: 0,
                              columns: const <DataColumn>[
                                DataColumn(label: Text(' ')),
                                DataColumn(label: Text(' '))
                              ],
                              rows: viewModel.currentEditingShoppingList.participantNames
                                  .map((e) => DataRow(cells: <DataCell>[
                                        DataCell(Text(e)),
                                        DataCell(DeleteFromListButton(
                                          listId: viewModel.currentEditingShoppingList.id,
                                          id: viewModel.currentEditingShoppingList.participantNames
                                              .indexOf(e),
                                          // deletePress: viewModel.removeItem,
                                          deletePress: viewModel.removeParticipant,
                                        ))
                                      ]))
                                  .toList(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                          DefaultButton(
                            text: "Add participant",
                            color: CustomColors.darkYellow,
                            onTap: () async {
                              final selectedName = await showSearch(
                                context: context,
                                delegate: CustomSearchDelegate(),
                              );
                              viewModel.addParticipantToShoppingList(selectedName);
                            },
                          )
                        ]),
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
                      ],
                    ),
                  ),
                ])),
          ),
        ),
      ),
    );
  }
}
