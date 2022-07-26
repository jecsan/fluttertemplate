import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio;

  AuthService(this._dio);

  Future login(String email) async {
    var params = {
      'user': {'email': email}
    };

    try {
      final response = await _dio.post('sessions/login', data: params);
    } on Exception {}
  }
}
