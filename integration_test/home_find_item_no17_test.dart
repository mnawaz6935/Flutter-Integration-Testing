import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import 'package:flutter_patrol_testing_framework/main.dart' as app;

void main() {
  patrolTest('Find item #17', ($) async {
    await $.pumpWidgetAndSettle(const app.MyApp());
    expect($('Login Page'), findsOneWidget);
    await $(#UserForm).enterText('emilys');
    await $(#PasswordForm).enterText('emilyspass');
    await $('Login').tap();
    await $('Ini item ke 17').scrollTo().tap();
  });
}
