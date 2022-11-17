import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/screens/settings/settings_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends ViewModelBuilderWidget<SettingsViewModel> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  SettingsViewModel viewModelBuilder(BuildContext context) => SettingsViewModel();

  @override
  Widget builder(BuildContext context, SettingsViewModel viewModel, Widget? child) {
    return const Scaffold(
      body: Center(child: Text('settings_view')),
    );
  }
}
