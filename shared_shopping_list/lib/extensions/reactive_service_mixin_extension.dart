// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:stacked/stacked.dart';

extension ReactiveServiceMixinExtension on ReactiveServiceMixin {
  void setState(Function()? fn) {
    fn?.call();
    // ignore: invalid_use_of_protected_member
    notifyListeners();
  }

  Future<void> setStateAsync(Future<void> Function()? fn) async {
    await fn?.call();
    // ignore: invalid_use_of_protected_member
    notifyListeners();
  }
}
