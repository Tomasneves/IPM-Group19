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
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const ScreenHeader(text: 'Adding New Item'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const ScreenHeader(text: 'To x Recipie'),
              ],
            ),
            const SizedBox(height: 60),
            const SizedBox(
              width: 299,
              child: TextField(
                style: TextStyle(height: 0.7),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.grey)),
                  hintText: 'Item Description',
                  filled: true,
                  fillColor: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const SizedBox(
              width: 299,
              child: const Text(
                'Suggestions:',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(
              width: 299,
              child: Text(
                'Tomato Sauce 200ml',
                style: TextStyle(backgroundColor: Colors.grey),
              ),
            ),
            const SizedBox(
              width: 299,
              child: Text(
                'Tomato Sauce 200ml',
                style: TextStyle(backgroundColor: Colors.grey),
              ),
            ),
            const SizedBox(
              width: 299,
              child: Text(
                'Tomato Sauce 200ml',
                style: TextStyle(backgroundColor: Colors.grey),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
