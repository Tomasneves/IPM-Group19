import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/global/person_circle_photo.dart';
import 'package:shared_shopping_list/extensions/extensions.dart';
import 'package:shared_shopping_list/models/shopping_list.dart';

class ShoppingListBriefInfo extends StatelessWidget {
  final ShoppingList shoppingList;

  const ShoppingListBriefInfo({required this.shoppingList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              shoppingList.shopName,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4),
            Text(
              shoppingList.timeOfPlannedShopping
                  .defaultDateTimeFormat(MaterialLocalizations.of(context)),
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${shoppingList.items.length} items',
                  style: const TextStyle(fontSize: 14),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: Text('●', style: TextStyle(fontSize: 6)),
                ),
                Text(
                  '${shoppingList.participantNames.length} participants',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        const PersonCirclePhoto(),
      ],
    );
  }
}
