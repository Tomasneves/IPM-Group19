import 'package:flutter/material.dart';
import 'package:shared_shopping_list/UI/global/blue_button.dart';
import 'package:shared_shopping_list/UI/global/rounded_outlined_card.dart';
import 'package:shared_shopping_list/UI/global/screen_header.dart';
import 'package:shared_shopping_list/UI/global/blue_button.dart';
import 'package:shared_shopping_list/UI/screens/shopping_list/shopping_list_viewmodel.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/local_widgets/shopping_list_brief_info.dart';
import 'package:shared_shopping_list/UI/screens/shopping_lists/shopping_lists_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/cupertino.dart';

import '../../../constants/custom_colors.dart';
import '../../global/default_button.dart';
import '../../global/delete_from_list_button.dart';
import 'login_viewmodel.dart';

class LoginView extends ViewModelBuilderWidget<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();

  @override
  Widget builder(BuildContext context, LoginViewModel viewModel, Widget? child) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SafeArea(
          //bottom: false,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // const SizedBox(height: 80),
              Expanded(
                flex: 1,
                child: Center(
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 200,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ScreenHeader(text: "ShoppingX"),
                ],
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    viewModel.hasError
                        ? Text(
                            'Invalid username or password',
                            style: TextStyle(color: Colors.red),
                          )
                        : SizedBox.shrink(),
                    const SizedBox(height: 20),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                      DefaultButton(
                        text: "Sign in",
                        color: CustomColors.logoDarkBrown,
                        onTap: () => viewModel.signInAndGoToApp(
                            usernameController.text, passwordController.text),
                      )
                    ]),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
