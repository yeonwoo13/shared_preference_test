import 'package:flutter/material.dart';
import 'package:shared_preference_test/page/CalculatorPage.dart';
import 'package:shared_preference_test/page/CounterPage.dart';
import 'package:shared_preference_test/page/JoinMembershipPage.dart';
import 'package:shared_preference_test/page/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JoinMembershipPage(),
    );
  }
}