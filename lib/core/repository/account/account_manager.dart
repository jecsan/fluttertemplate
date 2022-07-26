import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertemplate/core/repository/account/account.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:remoteservice/account_service.dart';

/// bool state represents logged in state
class AccountManager extends StateNotifier<Account?> {
  static const String ACCESS_TOKEN = 'access_token';
  static const String EMAIL = 'email';
  static const String NAME = 'name';
  static const String ID = 'id';

  AuthService _authService;
  String? accessToken;

  FlutterSecureStorage _flutterSecureStorage;

  AccountManager(this._flutterSecureStorage, this._authService) : super(null) {
    _getAccessToken();
  }

  Future _getAccessToken() async {
    accessToken = await _flutterSecureStorage.read(key: ACCESS_TOKEN);
  }

  Future login({required String username, required String password}) async {
    // Login to RemoteService, then save the token, profile, etc

    await _authService.login(username);

    await _flutterSecureStorage.write(
        key: ACCESS_TOKEN, value: "enterTokenHere");
    state = Account(1);
  }

  bool get isLoggedIn => accessToken != null;

  Future getAccount() async {}

  Future logout() async {
    accessToken = null;
  }
}
