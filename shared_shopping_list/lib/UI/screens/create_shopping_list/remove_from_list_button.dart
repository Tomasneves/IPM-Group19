import 'package:flutter/material.dart';
import 'package:shared_shopping_list/models/shopping_list.dart';


class RemoveParticipantButton0 extends StatelessWidget {
  final int index;
  final List<String> list;

  const RemoveParticipantButton0({super.key, required this.list, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      child: TextButton(
        onPressed: () {
          list.removeAt(index);
        },
        child: Text("x", style: TextStyle(color: Colors.red,)),
      )
    );
  }
}