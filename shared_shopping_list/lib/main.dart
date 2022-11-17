import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/app/app.dart';
import 'package:shared_shopping_list/app/setup.dart';

void main() async {
  await setup();
  runApp(const App());
}
