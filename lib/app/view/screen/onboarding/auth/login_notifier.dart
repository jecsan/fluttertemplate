import 'package:fluttertemplate/core/core_provider.dart';
import 'package:fluttertemplate/core/repository/account/account_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginProvider =
    StateNotifierProvider.autoDispose<LoginStateNotifier, bool>((ref) {
  return LoginStateNotifier(ref.watch(accountManagerProvider.notifier));
});

class LoginStateNotifier extends StateNotifier<bool> {
  AccountManager _accountManager;

  LoginStateNotifier(this._accountManager) : super(false);

  Future login({required String username, required String password}) async {
    await _accountManager.login(username: username, password: password);

    return _accountManager.isLoggedIn;
  }
}
