// A 'model' is anything that represent some meaningful entity in our app.

import 'package:shared_shopping_list/models/recipe.dart';
import 'package:shared_shopping_list/models/shopping_list.dart';
import 'package:uuid/uuid.dart';

class User {
  final String username;
  final String password;
  final List<ShoppingList> ownedLists;
  final List<ShoppingList> ParticipantLists;
  final List<User> friends;
  final List<Recipe> recipes;



  User({
    required this.username,
    required this.password,
    required this.ownedLists,
    required this.ParticipantLists,
    required this.friends,
    required this.recipes
  });
}

