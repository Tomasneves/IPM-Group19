import 'package:shared_shopping_list/app/app.locator.dart';
import 'package:shared_shopping_list/repositories/shopping_lists_repository.dart';
import 'package:shared_shopping_list/services/random_generator_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shared_shopping_list/app/app.locator.dart';
import 'package:shared_shopping_list/app/app.router.dart';

import '../../../models/shopping_list.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void signInAndGoToApp(String username, String password) {
    if (username == 'user' && password == 'user') {
      clearErrors();
      _navigationService.clearStackAndShow(Routes.homeView);
    } else {
      setError('err');
    }
  }
}
