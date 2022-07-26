import 'package:data/schema.dart';
import 'package:dio/dio.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertemplate/core/repository/account/account.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:remoteservice/account_service.dart';
import 'package:remoteservice/interceptors.dart';
import 'package:remoteservice/keys.dart';
import 'package:remoteservice/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'repository/account/account_manager.dart';

final databaseProvider = Provider<MyDatabase>((ref) => MyDatabase());

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) =>
    FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true)));
final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

final dioProvider = Provider<Dio>((ref) {
  return Dio(
      BaseOptions(baseUrl: FlavorConfig.instance.variables[KEY_BASE_URL]))
    ..interceptors.addAll(
      [
        ref.watch(tokenInterceptorProvider),
        LoggingInterceptor(),
      ],
    );
});

final authServiceProvider =
    Provider<AuthService>((ref) => AuthService(ref.watch(dioProvider)));

final userServiceProvider = Provider<UserService>((ref) {
  return UserService(ref.watch(dioProvider));
});

final accountManagerProvider =
    StateNotifierProvider<AccountManager, Account?>((ref) {
  return AccountManager(
    ref.watch(secureStorageProvider),
    ref.watch(authServiceProvider),
  );
});

final tokenInterceptorProvider = Provider<TokenInterceptor>((ref) {
  return TokenInterceptor(ref.watch(secureStorageProvider));
});
