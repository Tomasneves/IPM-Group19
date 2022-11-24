import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/screens/settings/settings_viewmodel.dart';
import 'package:shared_shopping_list/UI/screens/recipes_list/recipes_list_viewmodel.dart';
import 'package:shared_shopping_list/UI/global/green_button.dart';
import 'package:shared_shopping_list/UI/global/rounded_outlined_card.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/local_widgets/shopping_list_brief_info.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/shopping_lists_viewmodel.dart';
import 'package:shared_shopping_list/UI/global/person_circle_photo.dart';
import 'package:shared_shopping_list/extensions/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/cupertino.dart';

class SettingsView extends ViewModelBuilderWidget<SettingsViewModel> {
  const SettingsView({Key? key}) : super(key: key);

  final bool switchValue = false;

  @override
  SettingsViewModel viewModelBuilder(BuildContext context) =>
      SettingsViewModel();

  @override
  Widget builder(
      BuildContext context, SettingsViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: SizedBox(
            width: 339,
            child: Column(children: [
              const SizedBox(height: 130),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const ScreenHeader(text: 'Settings'),
                  const PersonCirclePhoto(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Notifications'),
                  CupertinoSwitch(
                    trackColor: Colors.red, // **INACTIVE STATE COLOR**
                    activeColor: Colors.green, // **ACTIVE STATE COLOR**
                    value: switchValue,
                    onChanged: (bool value) {
                      switchValue;
                    },
                  ),
                ],
              ),
              const Divider(
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Discard Changes Warning'),
                  CupertinoSwitch(
                    trackColor: Colors.red, // **INACTIVE STATE COLOR**
                    activeColor: Colors.green, // **ACTIVE STATE COLOR**
                    value: switchValue,
                    onChanged: (bool value) {
                      switchValue;
                    },
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
