import 'package:flutter/material.dart';
import 'package:shared_shopping_list/constants/custom_colors.dart';

class ScreenHeader extends StatelessWidget {
  final String text;
  const ScreenHeader({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 25, color: CustomColors.grey600),
    );
  }
}
