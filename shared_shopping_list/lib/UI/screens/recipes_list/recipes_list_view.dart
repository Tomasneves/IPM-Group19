import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/recipes_list_viewmodel.dart';
import 'package:shared_shopping_list/UI/global/green_button.dart';
import 'package:shared_shopping_list/UI/global/rounded_outlined_card.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/local_widgets/shopping_list_brief_info.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/shopping_lists_viewmodel.dart';
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
                          return SecondPage();
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

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

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
                        return ThirdPage();
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

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

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
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const ScreenHeader(text: 'Lasagna'),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      primary: Color.fromARGB(255, 45, 196, 50),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return FourthPage();
                      }));
                    },
                    child: const Text('+ Add new item'),
                  ),
                ],
              ),
              const SizedBox(height: 340),
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
                        return FirstPage();
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
    ;
  }
}

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: SizedBox(
            width: 339,
            child: Column(children: [
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ThirdPage();
                      }));
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                    style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                  ),
                ],
              ),
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
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.white)),
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: 'Item Description',
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
    ;
  }
}
