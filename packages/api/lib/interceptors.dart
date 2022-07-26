import 'dart:convert';

import 'package:colorize/colorize.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:remoteservice/keys.dart';

import 'core_extensions.dart';

class TokenInterceptor extends InterceptorsWrapper {
  final String _headerName = "Authorization";

  final FlutterSecureStorage _secureStorage;

  TokenInterceptor(this._secureStorage);

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var accessToken = await _secureStorage.read(key: ACCESS_TOKEN);

    if (accessToken != null) {
      options.headers.putIfAbsent(_headerName, () => accessToken);
    }

    return super.onRequest(options, handler);
  }
}

class LoggingInterceptor extends InterceptorsWrapper {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    color(
        "REQUEST[${options.method}] => URL: ${options.baseUrl}${options.path}",
        front: Styles.WHITE,
        isBold: true);
    if (options.queryParameters.isNotEmpty) {
      printPretty(options.queryParameters, textColor: Styles.WHITE);
    }
    if (options.data != null) {
      if (options.data is Map) {
        printPretty(options.data, textColor: Styles.WHITE);
      } else
        print(Colorize("BODY:${options.data} ").white());
    }
    print(
      Colorize("HEADERS:${options.headers}").white(),
    );

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    color(
        "RESPONSE[${response.statusCode}] => URL: ${response.requestOptions.baseUrl}/${response.requestOptions.path}",
        front: Styles.GREEN,
        isBold: true);
    if (response.data is Map) {
      printPretty(response.data, textColor: Styles.GREEN);
    } else {
      print(Colorize("DATA:${response.data}").green());
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    color(
        "ERROR[${err.response?.statusCode}] =>  ${err.requestOptions.baseUrl}${err.requestOptions.path}",
        front: Styles.RED,
        isBold: true);
    print(Colorize("DATA: ${err.response?.data}").red());
    return super.onError(err, handler);
  }
}
