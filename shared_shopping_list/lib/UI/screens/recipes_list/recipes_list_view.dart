import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/recipes_list_viewmodel.dart';
import 'package:shared_shopping_list/UI/global/green_button.dart';
import 'package:shared_shopping_list/UI/global/rounded_outlined_card.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/local_widgets/shopping_list_brief_info.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/shopping_lists_viewmodel.dart';
import 'package:stacked/stacked.dart';

class RecipesListView extends ViewModelBuilderWidget<RecipesListViewModel> {
  const RecipesListView({Key? key}) : super(key: key);

  @override
  RecipesListViewModel viewModelBuilder(BuildContext context) =>
      RecipesListViewModel();

  @override
  Widget builder(
      BuildContext context, RecipesListViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: SizedBox(
            width: 339,
            child: Column(children: [
              const SizedBox(height: 140),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const ScreenHeader(text: 'Adding New Item'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'To Lasagna Recipie',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const SizedBox(
                width: 339,
                child: TextField(
                  style: TextStyle(height: 1),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.white)),
                    hintText: 'Item Description',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color.fromARGB(255, 198, 198, 198),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const SizedBox(
                width: 339,
                child: const Text(
                  'Suggestions:',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 198, 198, 198),
                    ),
                    onPressed: () {},
                    child: const Text('Tomato Sauce 200ml'),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 198, 198, 198),
                    ),
                    onPressed: () {},
                    child: const Text('Pasta 300g'),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 198, 198, 198),
                    ),
                    onPressed: () {},
                    child: const Text('Olive Oil 500ml'),
                  ),
                ],
              ),
              SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    ),
                    onPressed: () {},
                    child: const Text('Done'),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
