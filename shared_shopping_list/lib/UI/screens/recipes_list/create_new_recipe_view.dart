import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/recipes_list_view.dart';
import 'package:shared_shopping_list/UI/global/green_button.dart';
import 'package:shared_shopping_list/UI/global/rounded_outlined_card.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/local_widgets/shopping_list_brief_info.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/shopping_lists_viewmodel.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/add_new_item_to_recipe.dart';
import 'package:stacked/stacked.dart';

class CreateNewRecipeView extends StatelessWidget {
  const CreateNewRecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 80),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return FirstPage();
                        }));
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const ScreenHeader(text: 'Create New Recipe'),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Recipe Name:',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 189,
                    height: 30,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white)),
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Color.fromARGB(255, 198, 198, 198),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 360),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return AddNewItemToRecipe();
                      }));
                    },
                    child: const Text('Done'),
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
