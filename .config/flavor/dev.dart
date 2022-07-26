import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:fluttertemplate/app.dart';
import 'package:remoteservice/keys.dart';

void main() {
  FlavorConfig(
    color: Colors.red,
    name: 'DEV',
    variables: {
      KEY_BASE_URL: '',
      TITLE: "Flutter Template",
    },
  );
  setupApp();
}
