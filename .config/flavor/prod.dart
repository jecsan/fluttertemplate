import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:fluttertemplate/app.dart';
import 'package:remoteservice/keys.dart';

void main() {
  FlavorConfig(
    color: Colors.red,
    name: 'PROD',
    variables: {
      KEY_BASE_URL: 'https://',
      TITLE: 'https://',
    },
  );
  setupApp();
}
