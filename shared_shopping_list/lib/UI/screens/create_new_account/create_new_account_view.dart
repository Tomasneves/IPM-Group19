import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/global/default_button.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/constants/custom_colors.dart';
import 'package:stacked/stacked.dart';
import 'create_new_account_viewmodel.dart';

class CreateNewAccountView extends ViewModelBuilderWidget<CreateNewAccountViewModel> {
  const CreateNewAccountView({Key? key}) : super(key: key);

  @override
  CreateNewAccountViewModel viewModelBuilder(BuildContext context) => CreateNewAccountViewModel();

  @override
  Widget builder(BuildContext context, CreateNewAccountViewModel viewModel, Widget? child) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        //bottom: false,
        child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    width: 200,
                    height: 200,
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  ScreenHeader(text: "Create new account"),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Username",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //const SizedBox(width: 10),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  //const SizedBox(width: 20)
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //const SizedBox(width: 10),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: confirmPasswordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm password',
                      ),
                    ),
                  ),
                  //const SizedBox(width: 20)
                ],
              ),
              const SizedBox(height: 30),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: const [
                DefaultButton(text: "Sign up", color: CustomColors.logoDarkBrown)
              ]),
              const SizedBox(height: 30),
            ])),
      ),
    );
  }
}
