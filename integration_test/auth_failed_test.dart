import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import 'package:flutter_patrol_testing_framework/main.dart' as app;

void main() {
  patrolTest('Login #2 Failed', ($) async {
    await $.pumpWidgetAndSettle(const app.MyApp());
    expect($('Login Page'), findsOneWidget);
    await $(#UserForm).enterText('bagus');
    await $(#PasswordForm).enterText('subagja');
    await $('Login').tap();
    await $('Null check operator used on a null value').waitUntilVisible();
  });
}
