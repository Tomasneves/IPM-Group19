import 'package:flutter/material.dart';
import 'package:shared_shopping_list/models/shopping_list.dart';


class RemoveFromListButton extends StatelessWidget {
  final int id;
  final Function removePress;
  final String listId;

  const RemoveFromListButton({super.key, required this.listId, required this.id, required this.removePress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      child: TextButton(
        onPressed: () {
          removePress(listId, id);
        },
        child: Text("x", style: TextStyle(color: Colors.red,)),
      )
    );
  }
}