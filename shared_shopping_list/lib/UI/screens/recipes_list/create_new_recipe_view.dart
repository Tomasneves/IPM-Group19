import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/recipes_list_viewmodel.dart';
import 'package:shared_shopping_list/UI/global/green_button.dart';
import 'package:shared_shopping_list/UI/global/rounded_outlined_card.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/local_widgets/shopping_list_brief_info.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/shopping_lists_viewmodel.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/create_new_recipe_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CreateNewRecipeView
    extends ViewModelBuilderWidget<CreateNewRecipeViewModel> {
  const CreateNewRecipeView({Key? key}) : super(key: key);

  @override
  CreateNewRecipeViewModel viewModelBuilder(BuildContext context) =>
      CreateNewRecipeViewModel();

  @override
  Widget builder(
      BuildContext context, CreateNewRecipeViewModel viewModel, Widget? child) {
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
                  GreenButton(
                    text: 'add new',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
