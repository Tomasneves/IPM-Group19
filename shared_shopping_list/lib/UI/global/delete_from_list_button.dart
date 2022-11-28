import 'package:flutter/material.dart';
import 'package:shared_shopping_list/models/shopping_list.dart';


class DeleteFromListButton extends StatelessWidget {
  final int id;
  final Function deletePress;
  final String listId;

  const DeleteFromListButton({super.key, required this.listId, required this.id, required this.deletePress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      child: TextButton(
        onPressed: () {
          deletePress(listId, id);          
        },
        child: Text("x", style: TextStyle(color: Colors.red,)),
      )
    );
  }
}