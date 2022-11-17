import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/global/default_button.dart';
import 'package:shared_shopping_list/constants/custom_colors.dart';

class BlueButton extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const BlueButton({required this.text, this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      text: text,
      color: CustomColors.lightBlue,
      onTap: onTap,
    );
  }
}
