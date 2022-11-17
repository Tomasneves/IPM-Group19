import 'package:flutter/material.dart';
import 'package:shared_shopping_list/constants/custom_colors.dart';

class RoundedOutlinedCard extends StatelessWidget {
  final String title;
  final Widget content;

  const RoundedOutlinedCard({required this.title, required this.content, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: CustomColors.grey600),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: CustomColors.darkBlack,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: CustomColors.grey600,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: content,
          ),
        ],
      ),
    );
  }
}
