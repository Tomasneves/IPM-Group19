import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/add_new_item_to_recipe.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/recipes_list_viewmodel.dart';
import 'package:shared_shopping_list/UI/global/green_button.dart';
import 'package:shared_shopping_list/UI/global/rounded_outlined_card.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/local_widgets/shopping_list_brief_info.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/shopping_lists_viewmodel.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/create_new_recipe_view.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/create_new_recipe_view.dart';
import 'package:stacked/stacked.dart';

class RecipesListView extends ViewModelBuilderWidget<RecipesListViewModel> {
  const RecipesListView({Key? key}) : super(key: key);

  @override
  RecipesListViewModel viewModelBuilder(BuildContext context) =>
      RecipesListViewModel();

  @override
  Widget builder(
      BuildContext context, RecipesListViewModel viewModel, Widget? child) {
    return FirstPage();
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 120),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const ScreenHeader(text: 'My Recipes'),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 45, 196, 50),
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          textStyle: const TextStyle(fontSize: 18)),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return CreateNewRecipeView();
                        }));
                      },
                      child: const Text('add new'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
