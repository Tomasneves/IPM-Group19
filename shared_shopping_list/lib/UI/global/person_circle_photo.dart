import 'package:flutter/material.dart';
import 'package:shared_shopping_list/constants/custom_colors.dart';

class PersonCirclePhoto extends StatelessWidget {
  const PersonCirclePhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: CustomColors.whiteBlue,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: const Padding(
        padding: EdgeInsets.all(1.0),
        child: Icon(
          Icons.person,
          color: CustomColors.lightBlueGray,
          size: 40,
        ),
      ),
    );
  }
}
