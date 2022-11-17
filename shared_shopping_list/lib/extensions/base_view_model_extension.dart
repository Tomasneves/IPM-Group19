import 'package:stacked/stacked.dart';

extension BaseViewModelExtension on BaseViewModel {
  void setState(Function()? fn) {
    fn?.call();
    notifyListeners();
  }

  Future<void> setAsyncState(Future<void> Function()? fn) async {
    await fn?.call();
    notifyListeners();
  }
}
