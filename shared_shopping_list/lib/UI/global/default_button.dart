import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final Color color;

  const DefaultButton({required this.text, required this.color, this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration:
            BoxDecoration(color: color, borderRadius: const BorderRadius.all(Radius.circular(6))),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
