import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_shopping_list/models/recipe.dart';

class RecipeBox extends StatelessWidget {
  final Recipe recipe;

  const RecipeBox({required this.recipe, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[100 + Random().nextInt(6) * 100],
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(20),
      child: Center(child: Text(recipe.recipeName, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16),)),
    );
  }
}
