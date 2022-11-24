import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/global/blue_button.dart';
import 'package:shared_shopping_list/UI/global/rounded_outlined_card.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/UI/global/blue_button.dart';
import 'package:shared_shopping_list/UI/screens/create_new_shopping_list/create_new_shopping_list_viewmodel.dart';
import 'package:shared_shopping_list/UI/screens/shopping_list/shopping_list_viewmodel.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/local_widgets/shopping_list_brief_info.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/shopping_lists_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/cupertino.dart';

import '../../../constants/custom_colors.dart';
import '../../global/default_button.dart';
import '../shopping_list/local_widgets/delete_from_list_button.dart';

class CreateNewShoppingListView extends ViewModelBuilderWidget<CreateNewShoppingListViewModel> {
  const CreateNewShoppingListView({Key? key}) : super(key: key);

 // final String listId;

  @override
  CreateNewShoppingListViewModel viewModelBuilder(BuildContext context) =>
      CreateNewShoppingListViewModel();

  @override
  Widget builder(BuildContext context, CreateNewShoppingListViewModel viewModel, Widget? child) {
    DateTime cdt = DateTime.now();
    DateTime dateTime = DateTime(cdt.year, cdt.month, cdt.day, cdt.hour+1, 0);
    TextEditingController nameTextController = TextEditingController();
    TextEditingController shopTextController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        //bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ScreenHeader(text: "New Shopping List"),
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
                              fontSize: 15,
                                color: Colors.black.withOpacity(1.0)
                            ),
                          ),
                        ),


                        child:
                          CupertinoDatePicker(
                            minuteInterval: 5,
                            initialDateTime: dateTime,
                            use24hFormat: true,
                            // This is called when the user changes the dateTime.
                            onDateTimeChanged: (DateTime newDateTime) {
                              dateTime = newDateTime;
                            },
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
                  children:[
                    BlueButton(text: "Create")
                  ]
              ),
              const SizedBox(height: 10),
            ]
            )

        ),
      ),
    );
  }
}
